{ config, lib, pkgs, modulesPath, ... }:

{

  boot = {

    # initrd = {
    #   # encrypt
    #   luks.devices = {
    #     luksroot = {
    #       device = "/dev/nvme0n1p2";
    #       allowDiscards = true;
    #       # luksOpen will be attempted before LVM scan
    #       preLVM = true;
    #     };
    #   };
    #   # display ownership notice before luks
    #   preLVMCommands = ''
    #     echo "--- OWNERSHIP NOTICE ---"
    #     echo "This device is property of iruzo"
    #     echo "If lost please contact at contact@iruzo.dev"
    #     echo "--- OWNERSHIP NOTICE ---"
    #   '';
    # };

    loader = {
      # grub = {
      #   enable = true;
      #   version = 2;
      #   device = "/dev/nvme0n1";
      #   efiSupport = true;
      #   # efiInstallAsRemovable = true;
      #   splashMode = "stretch";
      # };
      systemd-boot = {
        enable = true;
      };
      efi = {
        efiSysMountPoint = "/boot/efi";
        canTouchEfiVariables = true;
      };
    };

    kernelParams  = [
      # "acpi_rev_override=5"
      "rhgb"
      "quiet"
    ];

  };

  # Check S.M.A.R.T status of all disks and notify in case of errors
  services.smartd = {
    enable = true;
    # Monitor all devices connected to the machine at the time it's being started
    autodetect = true;
    # notifications = {
    #   x11.enable = if config.services.xserver.enable then true else false;
    #   wall.enable = true; # send wall notifications to all users
    # };
  };

  # Enable microcode updates for Intel CPU
  # hardware.cpu.intel.updateMicrocode = true;
  # Enable Kernel same-page merging
  hardware.ksm.enable = true;

  # Enable all the firmware
  hardware.enableAllFirmware = true;
  # Enable all the firmware with a license allowing redistribution. (i.e. free firmware and firmware-linux-nonfree)
  hardware.enableRedistributableFirmware = true;

  # amdvlk
  # vaapiIntel
  # amd
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
  # services.xserver.enable = true;
  # services.xserver.videoDrivers = [ "amdgpu" ];

  # Thermals and cooling
  services.thermald.enable = true;
  # This includes support for suspend-to-RAM and powersave features on laptops
  powerManagement.enable = true;
  # Enable powertop auto tuning on startup.
  # powerManagement.powertop.enable = false;
  # tlp
  services.tlp.enable = false;
  services.tlp.extraConfig = "USB_AUTOSUSPEND=0";

  # Install and configure Docker
  # virtualisation.docker = {
  #   enable = true;
  #   # Run docker system prune -f periodically
  #   autoPrune.enable = true;
  #   autoPrune.dates = "weekly";
  #   # Don't start the service at boot, use systemd socket activation
  #   enableOnBoot = false;
  # };
  # Install LXD
  # virtualisation.lxd.enable = true;
  # Install VB
  # virtualisation.virtualbox.host.enable = true;
  # Libvirtd (Qemu)
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    gnome.gnome-boxes
    iproute2
    iptables
  ];

  # Enable Pulseaudio
  # hardware.pulseaudio = {
  #   enable = true;
  #   # Only the full build has Bluetooth support.
  #   package = pkgs.pulseaudioFull;
  # };

  # Enable Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
