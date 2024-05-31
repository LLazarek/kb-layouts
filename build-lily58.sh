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

qmk compile -e CONVERT_TO=helios -kb lily58 -km lukas

