{

  description = "amnesia's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur-input.url = "github:nix-community/nur";
    ghostty-url = {
      url = "git+ssh://git@github.com/mitchellh/ghostty";
    };
    # winstonnur.url = "github:nekowinston/nur"; # flake lock --update-input winstonnur
    vscod-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.flake-compat.follows = "";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nur-input, vscod-extensions, ghostty-url, ... } @ inputs: let
    system = "x86_64-linux";
    overlays = f: p: {
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
      nur = import nur-input { nurpkgs = p; pkgs = p; };
      vscodext = vscod-extensions.extensions.${system};
      ghostty = import ghostty-url.packages.x86_64-linux.default;
    };
  in
  {
    homeConfigurations = {
      "amnesia" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [ ./.config/nix/usr/amnesia.nix ];
        pkgs = import nixpkgs {
          inherit system;
          overlays = [overlays];
          config.allowUnfree = true;
        };
      };
    };
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        # system = "x86_64-linux";
        inherit system;
        modules = [({ pkgs, ... }: {
          nixpkgs.overlays = [overlays];
          nixpkgs.config.allowUnfree = true;
          imports =
          [
            ./.config/nix/system/laptop/setup.nix
          ];
          # environment.systemPackages = [
          #   ghostty.packages.x86_64-linux.default
          # ];
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
