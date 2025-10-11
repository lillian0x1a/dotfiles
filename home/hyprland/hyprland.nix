{ pkgs, ... }:{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      env = [ ];
      exec-once = [ ];
      monitor = ", preferred, auto, 1";
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        resize_on_border = true;
        allow_tearing = false;
        layout = "master";
      };
      decoration = {
        rounding = 10;
        active_opacity = 1;
        inactive_opacity = 1;
        fullscreen_opacity = 1;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 1;
          passes = 4;
          vibrancy = 0.1696;
        };
      };
      animations = {
        enabled = true;
        workspace_wraparound = false;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
        natural_scroll = true;
        };
      };
      gestures = {
        workspace_swipe = true;
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
    };
  };
}
