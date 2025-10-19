{pkgs, ...}:{
  home.packages = [
    (pkgs.writeShellScriptBin "sysinfo.sh" ./sysinfo.sh)
    (pkgs.writeShellScriptBin "battery-notify.sh" ./battery-notify.sh)
  ];
  wayland.windowManager.hyprland.settings.exec-once = [
    "battery-notify.sh"
  ];
}