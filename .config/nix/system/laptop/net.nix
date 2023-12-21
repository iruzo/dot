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
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  services.blueman.enable = true;

  # printing
  services = {
    printing.enable = true; # http://localhost:631/
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };
  };

}
