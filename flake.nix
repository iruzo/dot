{

  description = "iruzo's flake";

  inputs = {

    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nur.url = "github:nix-community/nur";
    winstonnur.url = "github:nekowinston/nur"; # flake lock --update-input winstonnur

  };

  outputs = { self, nixpkgs, ... } @ inputs: let
    system = "x86_64-linux";
    overlays = f: p: {
      nur = import inputs.nur {
        nurpkgs = p;
        pkgs = p;
        repoOverrides = {
          nekowinston = import inputs.winstonnur { inherit (p) pkgs; };
        };
      };
      # [pkgname] = inputs.pkgname.packages.${system}.default;
      # gpt4all = inputs.winstonnur.packages.${system}.gpt4all;
      # sf-mono = inputs.winstonnur.packages.${system}.apple-sf-mono;
    };
    in {

    # sudo nixos-install --no-write-lock-file --flake github:iruzo/dots#laptop
    # sudo nixos-rebuild switch --flake '/etc/nixos#laptop'
    nixosConfigurations = {
      iruzo = nixpkgs.lib.nixosSystem {
        # system = "x86_64-linux";
        inherit system;
        modules =
        [({ pkgs, ... }: {
              nixpkgs.overlays = [overlays];
              # Allow "unfree" packages.
              nixpkgs.config.allowUnfree = true;
              imports =
              [
                ./.config/nix/laptop/setup.nix
                ./.config/nix/usr.nix
              ];
            })
        ];
      };
    };

  };
  nixConfig = {
    extra-trusted-substituters = [
      "https://nekowinston.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nekowinston.cachix.org-1:lucpmaO+JwtoZj16HCO1p1fOv68s/RL1gumpVzRHRDs="
    ];
  };

}
