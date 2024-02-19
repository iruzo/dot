{ lib, osConfig, ... }:

{

  imports = [

    ./fonts.nix
    ./gtk.nix

    ./app/git.nix
    ./app/gpg-ssh.nix
    ./app/nvim.nix
    ./app/term.nix
    # ./app/browser.nix

  ];

}
