# Arduino Rust Project Makefile

# MCU settings
MCU = atmega328p
F_CPU = 16000000UL

# Programmer settings
PROGRAMMER = arduino
PORT = /dev/cu.usbserial-110
BAUD = 57600

# Build settings
CARGO = cargo +nightly
RUSTFLAGS = -Z build-std=core
TARGET_DIR = target/avr-atmega328p/release
ELF_FILE = $(TARGET_DIR)/rust-arduino.elf
HEX_FILE = $(TARGET_DIR)/rust-arduino.hex

.PHONY: all build hex flash clean

all: hex

build:
	$(CARGO) build --release $(RUSTFLAGS)

hex: build
	avr-objcopy -O ihex $(ELF_FILE) $(HEX_FILE)
	@echo "Hex file created: $(HEX_FILE)"
	@avr-size $(ELF_FILE)

flash: hex
	avrdude -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -U flash:w:$(HEX_FILE):i

clean:
	$(CARGO) clean
