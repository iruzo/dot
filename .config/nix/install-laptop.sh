#!/bin/sh
sudo echo -n "apple" > /tmp/secret.key \
&& sudo nix --extra-experimental-features nix-command --extra-experimental-features flakes run github:nix-community/disko -- --mode disko /home/nixos/dots/.config/nix/laptop/disko.nix --arg disks '[ "/dev/nvme0n1" ]' \
&& sudo nixos-install --no-write-lock-file --flake github:iruzo/dots#laptop
