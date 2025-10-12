{ pkgs, ... }:{
  programs.waybar = {
    enable = true;
    # systemd.enable = true;
    settings = import ./config.nix { inherit pkgs; };
    style = builtins.readFile ./style.css;
  };
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
  ];
  home.packages = with pkgs; [
    waybar-mpris
  ];
}
