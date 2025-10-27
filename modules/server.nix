{lib, specialArgs, ...}:{
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
}