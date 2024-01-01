{

  description = "amnesia's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur-input.url = "github:nix-community/nur";
    # winstonnur.url = "github:nekowinston/nur"; # flake lock --update-input winstonnur
    # pipewire-screenaudio-input.url = "github:IceDBorn/pipewire-screenaudio";
    vscod-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.flake-compat.follows = "";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nur-input, vscod-extensions, ... } @ inputs: let
    system = "x86_64-linux";
    overlays = f: p: {
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
      nur = import nur-input { nurpkgs = p; pkgs = p; };
      vscodext = vscod-extensions.extensions.${system};
      # pipewire-screenaudio = pipewire-screenaudio-input;
    };
  in
  {
    homeConfigurations = {
      "amnesia" = home-manager.lib.homeManagerConfiguration {
        inherit nixpkgs-unstable;
        modules = [ ./.config/nix/usr/amnesia.nix ];
      };
    };
    # homeConfigurations."amnesia" = home-manager.lib.homeManagerConfiguration {
    #   inherit nixpkgs;
    #   modules = [ ./home.nix ];
    # };
    # home-manager = {
    #   users = {
    #     amnesia = import ./.config/nix/usr/amnesia.nix;
    #   };
    # };
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        # system = "x86_64-linux";
        inherit system;
        modules = [({ pkgs, ... }: {
          nixpkgs.overlays = [overlays];
          nixpkgs.config.allowUnfree = true;
          imports =
          [
            inputs.home-manager.nixosModules.home-manager
            ./home.nix
            ./.config/nix/system/laptop/setup.nix
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
