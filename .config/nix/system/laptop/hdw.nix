{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  boot = {

    kernel.sysctl = { "vm.swappiness" = 90; }; # cat /proc/sys/vm/swappiness

    # Clear /tmp during boot
    tmp.cleanOnBoot = true;

    initrd = {
      # preLVMCommands = ''
      #   echo "--- OWNERSHIP NOTICE ---"
      #   echo "This device is property of ruzo"
      #   echo "If lost please contact at contact@ruzo.sh"
      #   echo "--- OWNERSHIP NOTICE ---"
      # '';
      kernelModules = [ "amdgpu" ];
      availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
      secrets = { # setup keyfile
        "/crypto_keyfile.bin" = null;
      };
      # Enable swap on luks
      luks.devices."luks-e84c596d-8c04-4ccd-8a8d-45839cec27c4".device = "/dev/disk/by-uuid/e84c596d-8c04-4ccd-8a8d-45839cec27c4";
      luks.devices."luks-e84c596d-8c04-4ccd-8a8d-45839cec27c4".keyFile = "/crypto_keyfile.bin";
      # boot device
      luks.devices."luks-55f486b4-2d0e-48df-b435-b72caee24643".device = "/dev/disk/by-uuid/55f486b4-2d0e-48df-b435-b72caee24643";
    };
    kernelPackages = pkgs.linuxPackages_latest; # 6.5.8

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

  fileSystems = {
    "/" = {
      options = [ "noatime" "discard" ];
      device = "/dev/disk/by-uuid/d6fab7ce-6c57-4be7-8978-299d3807617e";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/4E4A-BC0E";
      fsType = "vfat";
    };
  };

  swapDevices = [ {
    device = "/dev/disk/by-uuid/ed023111-5d19-436b-a5cd-f32c6b955c5d";
  } ];

  security.rtkit.enable = true; # needed for pipewire
  services = {
    smartd = {                   # check disks
      enable = true;
      autodetect = true;
    };
    # homed.enable = true;         # home directory encryption
    fwupd.enable = true;         # firmware upload

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
  powerManagement.enable = true; # laptop power features

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
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
    pulseaudio.enable = false;
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
