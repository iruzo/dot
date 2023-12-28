{ inputs, config , pkgs, ... }:

{

  home-manager = {
    users = {
      amnesia = import ./.config/nix/usr/amnesia.nix;
    };
  };

}

