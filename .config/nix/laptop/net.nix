{ config, ... }:

{

  # networking
  networking.hostName = "ruzo";
  networking.networkmanager.enable = true;
  # networking.dhcpcd.enable = true;

  # Simple stateful dual-stack firewall
  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
    logRefusedConnections = true;
    checkReversePath = false; # for libvirtd
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
