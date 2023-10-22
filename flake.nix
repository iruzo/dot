{

  description = "ruzo's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # flake-utils.url = "github:numtide/flake-utils";
    # nur.url = "github:nix-community/nur";
    # winstonnur.url = "github:nekowinston/nur"; # flake lock --update-input winstonnur
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... } @ inputs: let
    system = "x86_64-linux";
    overlays = f: p: {
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
    };
  in
  {
    nixosConfigurations = {
      ruzo = nixpkgs.lib.nixosSystem {
        # system = "x86_64-linux";
        inherit system;
        modules = [({ pkgs, ... }: {
          nixpkgs.overlays = [overlays];
          nixpkgs.config.allowUnfree = true;
          imports =
          [
            ./.config/nix/laptop/setup.nix
            ./.config/nix/usr.nix
          ];
        })];
      };
    };
  };

  # nixConfig = {
  #   extra-trusted-substituters = [
  #     "https://nekowinston.cachix.org"
  #   ];
  #   extra-trusted-public-keys = [
  #     "nekowinston.cachix.org-1:lucpmaO+JwtoZj16HCO1p1fOv68s/RL1gumpVzRHRDs="
  #   ];
  # };

}
