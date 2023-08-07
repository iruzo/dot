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

  # The list of nameservers. It can be left empty if it is auto-detected through DHCP.
  # networking.nameservers = [ "1.0.0.1" "1.1.1.1" ];

  # Network usage statistics
  # services.vnstat.enable = true;

  # Monitoring
  # services.netdata = {
  #  enable = true;
  #  config = {
  #    global = {
  #      "default port" = "19999";
  #      "bind to" = "127.0.0.1";
  #    };
  #  };
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
}
