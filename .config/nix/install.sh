#!/bin/sh
sudo nix --extra-experimental-features nix-command --extra-experimental-features flakes run github:nix-community/disko -- --mode zap_create_mount $HOME/dots/.config/nix/laptop/disko.nix --arg disks '[ "/dev/vda" ]' \
&& sudo nixos-install --no-write-lock-file --flake https://github.com/iruzo/dots#vm
