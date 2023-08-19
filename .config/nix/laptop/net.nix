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

  # https://nixos.wiki/wiki/Bluetooth
  hardware.bluetooth = {
      enable = true;
      # Don't power up the default Bluetooth controller on boot
      powerOnBoot = false;
  };
  # Blueman
  services.blueman = {
    enable = true;
  };

}
