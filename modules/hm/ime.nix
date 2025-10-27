{lib, config, pkgs, ...}:
with lib;
{
  options.my-hm.ime.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the IME module.";
  };
  config = mkIf config.my-hm.ime.enable {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-skk
          fcitx5-gtk
        ];
        settings = {
          inputMethod = {
            GroupOrder."0" = "Default";
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "skk";
            };
            "Groups/0/Items/0".Name = "skk";
            "Groups/0/Items/1".Name = "keyboard-us";
          };
        };
      };
    };
    wayland.windowManager.hyprland.settings.exec-once = [
      "fcitx5 -d --replace"
    ];
  };
}
