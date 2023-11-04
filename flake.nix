{

  description = "ruzo's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # nur.url = "github:nix-community/nur";
    # winstonnur.url = "github:nekowinston/nur"; # flake lock --update-input winstonnur
    vscod-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.flake-compat.follows = "";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-thorium.url = "github:almahdi/nix-thorium";
    dwl-source = {
      url = "github:djpohly/dwl";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, vscod-extensions, flake-thorium, dwl-source, ... } @ inputs: let
    system = "x86_64-linux";
    overlays = f: p: {
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
      vscodext = vscod-extensions.extensions.${system};
      dwl = p.dwl.overrideAttrs (oldAttrs: rec {
        src = dwl-source;
        # conf = (builtins.readFile "/home/ruzo/.config/dwl/config.h");
        patches = [
          # (p.fetchpatch { url = "https://github.com/djpohly/dwl/compare/main...faerryn:cursor_warp.patch"; sha256 = "sha256-h0BBgrXwYv6/GvYyANcVVIkGHJTbUJzpwT5GglLw0jY="; })
          # (p.fetchpatch { url = "https://github.com/djpohly/dwl/compare/main...dm1tz:fmaster.patch"; sha256 = "sha256-MjARIxdJAusI91PrE8TKdL7JFnehK2d25So5mfNNND4="; })
        ];
      });
      thorium = p.callPackage ./.config/nix/pkgs/thorium.nix {};
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
            ./.config/nix/system/laptop/setup.nix
            ./.config/nix/pkgs/gui/sway.nix
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
