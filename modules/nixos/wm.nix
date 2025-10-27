{lib, config, pkgs, ...}:
with lib;
{
  options.my.wm.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the WIndow Manager module.";
  };
  config = mkIf config.my.wm.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}