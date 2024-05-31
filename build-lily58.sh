# this script is meant to me sourced

if [ "${PWD##*/}" != "qmk_firmware" ]; then
  echo "You should source this script inside the qmk_firmware directory"
  exit 1
fi

if [[ "$SHELL" != /nix/store/* ]]; then
    echo "You should source this script inside the qmk nix-shell"
    exit 1
fi

if [ ! -f "setup-done" ]; then
    qmk setup || exit 1
    touch setup-done
fi

qmk compile -e CONVERT_TO=helios -kb lily58 -km lukas || exit 1

echo "Do you want to flash the firmware now? (y/n)"
read -r answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo double-press the reset key on the lily and wait for it to show up as a usb then hit enter
    read -r answer || exit 1
    cp lily58_rev1_lukas_helios.uf2 /media/lukas/RPI-RP2/ && echo "flashed!"
fi

