{ ... }:{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };
      label = [
        {
          text = "Layout: $LAYOUT";
          font_size = 25;
          font_family = "JetBrainsMono Nerd Font";
          position = "30, -30";
          halign = "left";
          valign = "top";
        }
        {
          text = "cmd[update:1000] echo -e \"$(LC_TIME=en_GB.UTF-8 date +\"%A, %B %d\")\"";
          font_size = 28;
          position = "0, 490";
          halign = "center";
          valign = "center";
        }
        {
          text = "$TIME";
          font_size = 160;
          position = "0, 370";
          halign = "center";
          valign = "center";
        }
      ];
      input-field = {
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        fade_on_empty = false;
        placeholder_text = "󰌾 Logged in as $USER";
        hide_input = false;
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        position = "0, -47";
        halign = "center";
        valign = "center";
      };
    };
  };
}
