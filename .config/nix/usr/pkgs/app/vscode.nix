{ config, pkgs, inputs, ... }:

{

  programs.vscode = {
    enable = true;
    package = (vscode-with-extensions.override {
      vscode = unstable.vscode;
      vscodeExtensions = with pkgs.vscodext.vscode-marketplace; [
        asvetliakov.vscode-neovim

        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-azuretools.vscode-docker

        github.copilot
        github.copilot-chat
        github.vscode-pull-request-github
        github.vscode-github-actions
        github.remotehub
        gitlab.gitlab-workflow

        eamodio.gitlens                    # git
        usernamehw.errorlens               # error on lines
        pflannery.vscode-versionlens       # version checker
        christian-kohler.path-intellisense # path autocompletion
        aaron-bond.better-comments         # cool comments
        mintlify.document                  # autogenerate docs
        esbenp.prettier-vscode             # format code

        redhat.vscode-yaml
        rust-lang.rust-analyzer
        ms-python.python
        bbenoist.nix
      ];
    });
  };

}
