{ config, lib, pkgs, modulesPath, ... }:

{

  boot = {

    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        efiSysMountPoint = "/boot/efi";
        canTouchEfiVariables = true;
      };
    };

    kernelParams  = [
      "rhgb"
      "quiet"
    ];

  };

  # Enable microcode updates for Intel CPU
  # hardware.cpu.intel.updateMicrocode = true;
  # Enable Kernel same-page merging
  hardware.ksm.enable = true;

  # Enable all the firmware
  hardware.enableAllFirmware = true;
  # Enable all the firmware with a license allowing redistribution. (i.e. free firmware and firmware-linux-nonfree)
  hardware.enableRedistributableFirmware = true;

  hardware.opengl = {
    enable = true;
    driSupport = true; # vulkan
    driSupport32Bit = true; # vulkan 32 bit
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };
  # enable opencl support
  services.xmr-stak.openclSupport = true;

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

  # Enable Pulseaudio
  # hardware.pulseaudio = {
  #   enable = true;
  #   # Only the full build has Bluetooth support.
  #   package = pkgs.pulseaudioFull;
  # };

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
