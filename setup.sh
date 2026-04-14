#!/usr/bin/env bash

set -euo pipefail

build_dwm() {
  echo "Building dwm..."
  make -C .dwm
}

build_dwmblocks() {
  echo "Building dwmblocks..."
  make -C .dwmblocks
}

build_dmenu() {
  echo "Building dmenu..."
  make -C .dmenu
}

install_dwm() {
  echo "Installing dwm..."
  sudo make -C .dwm install
}

install_dwmblocks() {
  echo "Installing dwmblocks..."
  sudo make -C .dwmblocks install
}

install_dmenu() {
  echo "Installing dmenu..."
  sudo make -C .dmenu install
}

main() {
  build_dwm
  build_dwmblocks
  build_dmenu

  install_dwm
  install_dwmblocks
  install_dmenu
}

main "$@"
