{...}:{
  wayland.windowManager.hyprland.settings.exec-once = [
    "eww daemon"
  ];
  programs.eww = {
    enable = true;
    configDir = ./.;
  };
}