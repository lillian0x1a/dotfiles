{config, lib, specialArgs, ...}:
with lib;
{
  options.my.common.enable = mkOption {
    type = types.bool;
    default = true;
    description = "Enable the Common module.";
  };
  config = mkIf config.my.common.enable {
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
  };
}
