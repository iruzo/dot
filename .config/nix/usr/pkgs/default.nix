{ lib, osConfig, ... }:

{

  imports = [

    ./fonts.nix

    ./app/git.nix
    # ./app/browser.nix
    ./app/gpg-ssh.nix
    ./app/nvim.nix
    ./app/wezterm.nix

    ./rice/gtk.nix

  ];

}
