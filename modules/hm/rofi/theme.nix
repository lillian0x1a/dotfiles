{mkLiteral}:{
  window = {
    height = mkLiteral "30em";
    width = mkLiteral "57em";
    transparency = "real";
    enabled = true;
    cursor = mkLiteral "default";
    spacing = mkLiteral "0em";
    padding = mkLiteral "0em";
    border-radius = mkLiteral "15px";
  };

  mainbox = {
    enabled = true;
    spacing = mkLiteral "1em";
    padding = mkLiteral "1em";
    orientation = mkLiteral "horizontal";
    children = map mkLiteral [ "inputbar" "listbox" ];
  };

  inputbar = {
    enabled = true;
    width = mkLiteral "27em";
    spacing = mkLiteral "0em";
    padding = mkLiteral "0em";
    children = map mkLiteral [ "entry" ];
    background-color = mkLiteral "transparent";
    background-image = mkLiteral "url(\"~/.config/rofi/rofi.png\", height)";
    border-radius = mkLiteral "1em";
  };

  entry = { enabled = false; };

  listbox = {
    spacing = mkLiteral "0em";
    padding = mkLiteral "0em";
    children = map mkLiteral [ "dummy" "listview" "dummy" ];
  };

  listview = {
    enabled = true;
    spacing = mkLiteral "0em";
    padding = mkLiteral "0em";
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
  };

  dummy = { background-color = mkLiteral "transparent"; };

  element = {
    enabled = true;
    spacing = mkLiteral "1em";
    padding = mkLiteral "0.5em 0.5em 0.5em 1.5em";
    cursor = mkLiteral "pointer";
    background-color = mkLiteral "transparent";
  };

  "element selected.normal" = {
    border-radius = mkLiteral "15px";
  };

  "element-icon" = {
    size = mkLiteral "2.7em";
    cursor = mkLiteral "inherit";
  };

  "element-text" = {
    vertical-align = mkLiteral "0.5";
    horizontal-align = mkLiteral "0.0";
    cursor = mkLiteral "inherit";
    # background-color = mkLiteral "transparent";
  };

  "error-message" = {
    text-transform = mkLiteral "capitalize";
    children = map mkLiteral [ "textbox" ];
  };

  # textbox = {
  #   "text-color" = "inherit";
  #   "background-color" = "inherit";
  #   "vertical-align" = 0.5;
  #   "horizontal-align" = 0.5;
  # };
}