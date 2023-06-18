{

  description = "iruzo's flake"

  inputs = {

    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11"

  };

  outputs = { self, nixpkgs }: {

    # sudo nixos-install --flake https://github.com/iruzo/dots#laptop
    # sudo nixos-rebuild switch --flake '/etc/nixos#laptop'
    nixosConfiguration.laptop = nixpks.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [({ pkgs, ... }: {
         imports =
           [
             ./.config/nix/laptop/setup.nix
           ] ;
        })
      ];
    }

    nixosConfiguration.vm = nixpks.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [({ pkgs, ... }: {
         imports =
           [
             ./.config/nix/vm/setup.nix
           ] ;
        })
      ];
    }

  };

}
