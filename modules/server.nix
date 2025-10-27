{lib, config, specialArgs, ...}:
with lib;
{
  options.my.server.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the Server module.";
  };
  config = mkIf config.my.server.enable {
    networking = {
      useDHCP = lib.mkDefault true;
      interfaces.ens18.ipv4.addresses = [
        {
          address = "${specialArgs.ipAddress}";
          prefixLength = 24;
        }
      ];
      defaultGateway = "${specialArgs.defaultGateway}";
      nameservers = [
        "9.9.9.9"
        "1.1.1.1"
      ];
    };
  };
}