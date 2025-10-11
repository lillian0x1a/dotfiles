{ pkgs, ... }:{
  services.swww.enable = true;
  home.file.".config/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
    force = true;
  };
}
