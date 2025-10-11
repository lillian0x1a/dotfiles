{ pkgs, ... }:{
  programs.wofi = {
    enable = true;
    settings = {
      show-icons = true;
      show-scrollbar = false;
      font = "monospace 10";
      width = "300px";
      lines = 10;
      line-height = 1.5;
      y-offset = 30;
      x-offset = 30;
      # location = "top-right";
      hide-cursor = true;
      opacity = 0.9;
    };
  };
}