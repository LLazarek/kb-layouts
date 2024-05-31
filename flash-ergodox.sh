#!/bin/bash

teensy_loader_cli -w -v --mcu=atmega32u4 "$1"
