{lib, config, ...}:
with lib;
{
  options.my.server = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable the Server module.";
    };
    ipAddress = mkOption {
      type = types.str;
      default = "";
      description = "Static IP address for the server.";
    };
    defaultGateway = mkOption {
      type = types.str;
      default = "";
      description = "Default gateway for the server.";
    };
  };
  config = mkIf config.my.server.enable {
    networking = {
      useDHCP = lib.mkDefault true;
      interfaces.ens18.ipv4.addresses = [
        {
          address = "${config.my.server.ipAddress}";
          prefixLength = 24;
        }
      ];
      defaultGateway = "${config.my.server.defaultGateway}";
      nameservers = [
        "9.9.9.9"
        "1.1.1.1"
      ];
    };
  };
}