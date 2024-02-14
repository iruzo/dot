{ config, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    extraPython3Packages = (ps: with ps; [
      pynvim
      requests
      prompt-toolkit
      tiktoken
      python-dotenv
    ]);
  };

}
