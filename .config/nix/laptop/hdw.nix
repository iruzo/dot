{ config, lib, pkgs, modulesPath, ... }:

{

  boot = {

    # Clear /tmp during boot
    tmp.cleanOnBoot = true;

    initrd = {
      preLVMCommands = ''
        echo "--- OWNERSHIP NOTICE ---"
        echo "This device is property of ruzo"
        echo "If lost please contact at contact@ruzo.sh"
        echo "--- OWNERSHIP NOTICE ---"
      '';
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # kernelParams  = [
    #   "rhgb"
    #   "quiet"
    #   "idle=nomwait"
    #   # "rcu_nocbs=0-15"
    #   "processor.max_cstate=5"
    #   "supergfxd.mode=Integrated"
    # ];

  };

  services = {
    # smartd = {
    #   enable = true;
    #   autodetect = true;
    # };
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };

  # hardware.ksm.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true; # vulkan
    driSupport32Bit = true; # vulkan 32 bit
    extraPackages = with pkgs; [
      amdvlk
      vaapiVdpau
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };
  # enable opencl support
  services.xmr-stak.openclSupport = true;

  # Libvirtd (Qemu)
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    iproute2
    iptables
  ];

  # Bluetooth
  # https://nixos.wiki/wiki/Bluetooth
  # hardware.bluetooth.enable = false;
  # Don't power up the default Bluetooth controller on boot
  # hardware.bluetooth.powerOnBoot = false;
  # hardware = {
  #   bluetooth = {
  #     enable = true;
  #   };
  # };
  # # Blueman
  # services.blueman = {
  #   enable = true;
  # };

}
