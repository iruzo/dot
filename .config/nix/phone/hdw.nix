{ config, lib, pkgs, modulesPath, ... }:

{

  boot.loader.grub = {
    enable = true;
    version = 2;
    devices = [ "/dev/mmcblk2boot0" ];
    # useOSProber = true;
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

  # Enable OpenGL drivers
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
  ];
  hardware.opengl.driSupport = true; # vulkan
  # amdvlk
  # vaapiIntel
  # amd
  # services.xserver.enable = true;
  # services.xserver.videoDrivers = [ "amdgpu" ];

  # This includes support for suspend-to-RAM and powersave features on laptops
  powerManagement.enable = true;
  zramSwap.enable = true;
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
  # virtualisation.libvirtd.enable = true;
  # programs.dconf.enable = true;
  # environment.systemPackages = with pkgs; [
  #   virt-manager
  #   iproute2
  #   iptables
  # ];

  # Enable Pulseaudio
  hardware.pulseaudio = {
    enable = true;
    # Only the full build has Bluetooth support.
    package = pkgs.pulseaudioFull;
  };

  # Enable Pipewire
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  # };

  # Bluetooth
  # https://nixos.wiki/wiki/Bluetooth
  hardware.bluetooth.enable = false;
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
