# Rust Arduino Project

This is a Rust implementation of a simple Arduino project.

## What it does

Sends "Hey no blood, no trabajo" to the serial port at 9600 baud every second.

## Requirements

- Rust nightly toolchain
- avr-gcc toolchain
- avrdude (for flashing)

## Building

```bash
# Build the project
make build

# Build and create hex file
make hex

# Flash to Arduino
make flash
```

Or directly with cargo:

```bash
cargo +nightly build --release -Z build-std=core
```

## Configuration

Settings are configured in the Makefile:
- MCU: atmega328p
- F_CPU: 16000000UL (16MHz)
- Baud rate: 9600 (serial)
- Programmer: arduino
- Port: /dev/cu.usbserial-110
- Programmer baud: 57600

## about avr-atmega328p.json

I took the file from [here](https://github.com/avr-rust/ruduino/blob/c0574999752c6bfc2c190312661a0c264247e5b1/avr-atmega328p.json#L4) and applied small fixes to make it work with the current Rust nightly.
