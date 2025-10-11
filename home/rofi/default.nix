{ pkgs, config, ... }:{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    modes = [ "drum" ];
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        main-bg = "#11111b60";
        main-fg = "#cdd6f4ff";
        main-br = "#cba6f7ff";
        main-ex = "#f5e0dcff";
        select-bg = "#b4befe60";
        select-fg = "#11113360";
      };
      configuration = {
        modi = "drun";
        show-icons = true;
        drun-display-format = "{name}";
        window-format = "{w}{t}";
        icon-theme = "Tela-circle-dracula";
      };

      window = {
        height = mkLiteral "30em";
        width = mkLiteral "57em";
        transparency = mkLiteral "real";
        fullscreen = false;
        enabled = true;
        cursor = mkLiteral "default";
        spacing = mkLiteral "0em";
        padding = mkLiteral "0em";
        border-color = "@main-br";
        # background-color = "@main-bg";
        border-radius = mkLiteral "15px";
      };

      mainbox = {
        enabled = true;
        spacing = mkLiteral "1em";
        padding = mkLiteral "1em";
        orientation = mkLiteral "horizontal";
        children = map mkLiteral [ "inputbar" "listbox" ];
        background-color = "transparent";
      };

      inputbar = {
        enabled = true;
        width = mkLiteral "27em";
        spacing = mkLiteral "0em";
        padding = mkLiteral "0em";
        children = [ "entry" ];
        background-color = mkLiteral "transparent";
        # background-image = ''url("~/.config/rofi/rofi.png", height)'';
        border-radius = mkLiteral "1em";
      };

      entry = { enabled = false; };

      listbox = {
        spacing = mkLiteral "0em";
        padding = mkLiteral "0em";
        children = map mkLiteral [ "dummy" "listview" "dummy" ];
        background-color = "transparent";
      };

      listview = {
        enabled = true;
        spacing = mkLiteral "0em";
        padding = mkLiteral "1em";
        columns = 1;
        lines = 7;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        expand = false;
        fixed-height = true;
        fixed-columns = true;
        cursor = mkLiteral "default";
        background-color = mkLiteral "transparent";
        text-color = "@main-fg";
      };

      dummy = { background-color = "transparent"; };

      element = {
        enabled = true;
        spacing = mkLiteral "1em";
        padding = mkLiteral "0.5em 0.5em 0.5em 1.5em";
        cursor = mkLiteral "pointer";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@main-fg";
      };

      "element selected.normal" = {
        # background-color = "@select-bg";
        # text-color = "@select-fg";
        border-radius = mkLiteral "15px";
      };

      "element-icon" = {
        size = mkLiteral "2.7em";
        cursor = mkLiteral "inherit";
        # background-color = "transparent";
        # text-color = "inherit";
      };

      # "element-text" = {
      #   "vertical-align" = 0.5;
      #   "horizontal-align" = 0.0;
      #   cursor = "inherit";
      #   background-color = "transparent";
      #   text-color = "inherit";
      # };

      "error-message" = {
        "text-color" = mkLiteral "@main-fg";
        "background-color" = mkLiteral "@main-bg";
        "text-transform" = mkLiteral "capitalize";
        children = [ "textbox" ];
      };

      # textbox = {
      #   "text-color" = "inherit";
      #   "background-color" = "inherit";
      #   "vertical-align" = 0.5;
      #   "horizontal-align" = 0.5;
      # };
    };
  };
  home.file.".config/rofi/rofi.png".source = ./rofi.png;
}
