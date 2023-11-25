{ config, lib, pkgs, modulesPath, ... }:

{

  swapDevices = [{ device = "/swap"; size = "16G"; }];
  # swapDevices = lib.mkForce [ ]; # disable all swap

  boot = {

    kernel.sysctl = { "vm.swappiness" = 90; }

    # Clear /tmp during boot
    tmp.cleanOnBoot = true;

    initrd = {
      preLVMCommands = ''
        echo "--- OWNERSHIP NOTICE ---"
        echo "This device is property of ruzo"
        echo "If lost please contact at contact@ruzo.sh"
        echo "--- OWNERSHIP NOTICE ---"
      '';
      # kernelModules = [ "amdgpu" ];
    };
    kernelPackages = pkgs.linuxPackages_latest; # 6.5.1

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # kernelParams  = [
    #   "rhgb"
    #   "quiet"
    #   "splash"
    #   "processor.max_cstate=0"          # amd anti-freeze
    #   "amd_iommu=off"                   # amd anti-freeze
    #   "amdgpu.ppfeaturemask=0xffffbffd" # amd anti-freeze
    # ];

  };

  services = {
    smartd = {
      enable = true;
      autodetect = true;
    };
  };
  powerManagement.enable = true; # laptop power features

  hardware = {
    ksm.enable = true;
    opengl = {
      enable = true;
      driSupport = true;      # vulkan
      driSupport32Bit = true; # vulkan 32 bit
      extraPackages = with pkgs; [
        amdvlk                # can be used in addition to mesa radv drivers
        rocm-opencl-icd       # opencl
        rocm-opencl-runtime   # opencl
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };

  # Libvirtd (Qemu)
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    iproute2
    iptables
  ];

}
