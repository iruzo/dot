{ config, pkgs, inputs, ... }:

{

  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    # needed for copilot and linters
    withNodeJs = true;
    extraPython3Packages = (ps: with ps; [
      # needed for copilotchat
      pynvim
      requests
      prompt-toolkit
      tiktoken
      python-dotenv
    ]);
  };

}
