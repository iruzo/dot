# vm
# sudo nix --extra-experimental-features nix-command --extra-experimental-features flakes run github:nix-community/disko -- --mode zap_create_mount dotfiles/.config/nix/laptop/disko.nix --arg disks '[ "/dev/vda" ]' && sudo nixos-generate-config --root /mnt && sudo cp -r dotfiles/.config/nix/* /mnt/etc/nixos/
# laptop
# sudo nix --extra-experimental-features nix-command --extra-experimental-features flakes run github:nix-community/disko -- --mode zap_create_mount dotfiles/.config/nix/laptop/disko.nix --arg disks '[ "/dev/nvme0n1" ]' && sudo nixos-generate-config --root /mnt && sudo cp -r dotfiles/.config/nix/* /mnt/etc/nixos/

# REMEMBER TO UNCOMMENT THE CONFIG

{ config, pkgs, lib, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ./vm/setup.nix
      # ./laptop/setup.nix
    ];
}
