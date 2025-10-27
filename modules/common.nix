{specialArgs, ...}:{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "en_GB.UTF-8";
  networking = {
    hostName = specialArgs.hostname;
    networkmanager.enable = true;
  };
}