{ pkgs, ... }:{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./rofi.rasi;
    };
  home.file.".config/rofi/rofi.png".source = ./rofi.png;
}