{

  description = "iruzo's flake";

  inputs = {

    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

  };

  outputs = { self, nixpkgs, ... }: {

    # sudo nixos-install --no-write-lock-file --flake github:iruzo/dots#laptop
    # sudo nixos-rebuild switch --flake '/etc/nixos#laptop'
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          [({ pkgs, ... }: {
           imports =
             [
               ./.config/nix/laptop/setup.nix
             ];
          })
        ];
      };
      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          [({ pkgs, ... }: {
           imports =
             [
               ./.config/nix/vm/setup.nix
             ];
          })
        ];
      };
    };

  };

}
