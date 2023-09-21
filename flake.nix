{

  description = "ruzo's flake";

  inputs = {

    # unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # nur.url = "github:nix-community/nur";
    # winstonnur.url = "github:nekowinston/nur"; # flake lock --update-input winstonnur

  };

  outputs = { self, nixpkgs, ... } @ inputs:
  {
    nixosConfigurations = {
      ruzo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
        [
          ./.config/nix/laptop/setup.nix
          ./.config/nix/usr.nix
        ];
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
