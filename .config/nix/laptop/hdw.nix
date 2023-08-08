{ config, lib, pkgs, modulesPath, ... }:

{

  boot = {

    # Clear /tmp during boot
    # tmp.cleanOnBoot = true;

    initrd = {
      preLVMCommands = ''
        echo "--- OWNERSHIP NOTICE ---"
        echo "This device is property of ruzo"
        echo "If lost please contact at contact@ruzo.sh"
        echo "--- OWNERSHIP NOTICE ---"
      '';
      kernelModules = [ "amdgpu" ];
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelParams  = [
      "rhgb"
      "quiet"
      "splash"
      "processor.max_cstate=0"
    ];

  };

  services = {
    smartd = {
      enable = true;
      autodetect = true;
    };
    # asusd = {
    #   enable = true;
    #   enableUserService = true;
    # };
  };

  hardware = {
    ksm.enable = true;
    opengl = {
      enable = true;
      driSupport = true; # vulkan
      # driSupport32Bit = true; # vulkan 32 bit
    };
  };
  # # enable opencl support
  # services.xmr-stak.openclSupport = true;

  # Libvirtd (Qemu)
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    iproute2
    iptables
  ];

}
