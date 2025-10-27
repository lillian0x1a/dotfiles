{lib, config, ...}:
with lib;
{
  options.my-hm.eww.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the EWW module.";
  };
  config = mkIf config.my-hm.eww.enable {
    wayland.windowManager.hyprland.settings.exec-once = [
      "eww daemon"
    ];
    programs.eww = {
      enable = true;
      configDir = ./.;
    };
  };
}