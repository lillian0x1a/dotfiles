{specialArgs, lib, ...}:{
  networking = {
    hostName = "${specialArgs.hostname}";
    useDHCP = lib.mkDefault true;
    interfaces.ens18.ipv4.addresses = [
      {
        address = "192.168.11.150";
        prefixLength = 24;
      }
    ];
    defaultGateway = "192.168.11.1";
    nameservers = [
      "9.9.9.9"
      "1.1.1.1"
    ];
  };
}