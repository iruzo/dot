{
  description = "iruzo's home manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    # reuse your vscode‑extensions input
    vscod-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.flake-compat.follows = "";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, flake-utils, vscod-extensions }:
    let
      system   = builtins.head flake-utils.lib.defaultSystems;
      username = builtins.getEnv "USER";

      overlay = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        vscodext = vscod-extensions.extensions.${system};
      };

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
        config.allowUnfree = true;
      };
    in {
      homeConfigurations = {
        "${username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs system username;
          homeDirectory = "/home/${username}";
          stateVersion  = "24.11";

          modules = [
            {
              home.packages = with pkgs; [
                unstable.google-chrome
                unstable.python3
                unstable.nodejs_23
                unstable.nodePackages.prettier
                unstable.stylelint
                unstable.git
                unstable.mergiraf
                unstable.yash
              ];

              programs.vscode = {
                enable = true;
                package = pkgs.unstable.vscode-with-extensions.override {
                  vscodeExtensions = with pkgs.vscodext; [
                    github.github-vscode-theme
                    github.vscode-github-actions
                    github.copilot
                    ms-vsliveshare.vsliveshare
                    ms-azuretools.vscode-docker
                    eamodio.gitlens
                    gruntfuggly.todo-tree
                    jnoortheen.nix-ide
                    pkief.material-icon-theme
                    usernamehw.errorlens
                    xyz.local-history
                    christian-kohler.path-intellisense
                  ];
                };
                settings = {
                  "update.mode"               = "none";
                  "workbench.externalBrowser" = "google-chrome-stable";
                  "workbench.colorTheme"      = "GitHub Dark";
                  "workbench.iconTheme"       = "material-icon-theme";
                  "window.menuBarVisibility"  = "compact";
                  "window.titleBarStyle"      = "custom";
                };
              };

              home.file.".yashrc" = {
                text = ''
                  . --autoload --no-alias initialization/common
                  git config core.hooksPath hooks
                  source $HOME/.config/.shrc
                '';
              };

              home.sessionVariables.SHELL = "${pkgs.yash}/bin/yash";
            }
          ];
        };
      };
    };
}

