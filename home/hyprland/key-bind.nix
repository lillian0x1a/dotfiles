{ pkgs, ... }:{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "ghostty";
    "$menu" = "rofi -show drun";
    "$brouwser" = "firefox";
    "$power-menu" = "${builtins.toString ../rofi/powermenu.sh}";
    "$show-time" = "${builtins.toString ../scripts/showtime.sh}";
    "$sysinfo" = "${builtins.toString ../scripts/sysinfo.sh}";
    "$toggle-eww" = "${builtins.toString ../eww/scripts/toggle-eww.sh}";
    bind = [
      "$mainMod, Return, exec, $terminal"
      "$mainMod, X, killactive,"
      "$mainMod, Backspace, exit,"
      "$mainMod, V, togglefloating,"
      "$mainMod, D, exec, $menu"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, T, togglesplit," # dwindle
      "$mainMod, W, exec, hyprlock"
      "$mainMod, Q, exec, $power-menu"
      "$mainMod, B, exec, $brouwser"
      "$mainMod, C, exec, $show-time"
      "$mainMod, I, exec, $sysinfo"
      "$mainMod, M, exec, $toggle-eww"
      #FullScreen mode
      "$mainMod, F, fullscreen, 1"
      "$mainMod, G, fullscreen"
      # Move focus
      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"
      # Switch workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"
      # Move active window to a workspace
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"
      # Example special workspace (scratchpad)
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_up, workspace, e+1"
      "$mainMod, mouse_down, workspace, e-1"
      #brightness
      " , XF86MonBrightnessUp, exec, swayosd-client --brightness raise 5"
      " , XF86MonBrightnessDown, exec,  swayosd-client --brightness lower 5"
    ];
    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    binde =[
      " , XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise --max-volume 100"
      " , XF86AudioLowerVolume, exec, swayosd-client --output-volume lower --max-volume 100"
      " , XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
    ];
  };
}
