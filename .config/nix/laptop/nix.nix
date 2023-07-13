{ config, pkgs, ... }:

{
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    # Automatically run the garbage collector
    gc.automatic = false;
    gc.dates = "12:00";
    # Automatically run the nix store optimiser
    optimise.automatic = false;
    optimise.dates = [ "12:00" ];
    # Nix automatically detects files in the store that have identical contents, and replaces them with hard links to a single copy.
    settings.auto-optimise-store = true;
    # maximum number of concurrent tasks during one build
    settings.cores = 4;
    # maximum number of jobs that Nix will try to build in parallel
    settings.max-jobs = 4;
    # perform builds in a sandboxed environment
    settings.sandbox = true;
  };
}
