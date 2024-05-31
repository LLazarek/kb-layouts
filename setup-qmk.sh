#!/bin/bash

if [ "${PWD##*/}" != "keeb" ]; then
  echo "You should run this script inside the keeb directory"
  exit 1
fi

if [ ! -d "qmk_firmware" ]; then
  git clone https://github.com/qmk/qmk_firmware.git || exit 1
fi

if [ ! -L "qmk_firmware/keyboards/lily58/keymaps/lukas" ]; then
  pushd qmk_firmware/keyboards/lily58/keymaps || exit 1
  ln -s ../../../../lily58 lukas || exit 1
  popd
fi

# nix shell in
cd qmk_firmware || exit 1
nix-shell
