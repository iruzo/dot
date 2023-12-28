{ config, pkgs, ... }:

{

  programs.git = {

    enable = true;
    userName = "ruzo";
    userEmail = "dev@ruzo.sh";
    diff-so-fancy.enable = true;
    lfs.enable = true;

    package = pkgs.symlinkJoin {
      name = "git";
      paths = [pkgs.git];
      postBuild = "rm $out/etc/gitconfig || true";
    };

    extraConfig = {
      credential.helper = "store";
      init.defaultBranch = "main";
      push.default = "current";
      push.gpgSign = "if-asked";
      rebase.autosquash = true;
    };

  };

}
