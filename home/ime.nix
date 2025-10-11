{ pkgs, ... }:{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-mozc         # Mozc engine for Japanese input.
        fcitx5-gtk          # GTK integration modules for Fcitx5.
        fcitx5-nord
      ];
      settings = {
        inputMethod = {
          GroupOrder."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "mozc";
          };
          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "mozc";
        };
      };
    };
  };
  wayland.windowManager.hyprland.settings.exec-once = [
    # "fcitx5-remote -r"
    "fcitx5 -d --replace"
  ];
}
