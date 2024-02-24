{ lib, osConfig, ... }:

{

  imports = [

    ./fonts.nix
    ./gtk.nix

    ./app/git.nix
    ./app/gpg-ssh.nix
    ./app/term.nix
    ./app/nvim.nix
    ./app/vscode.nix
    # ./app/browser.nix

  ];

}
