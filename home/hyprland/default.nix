{ pkgs, ... }:{
  imports = [
    ./hyprland.nix
    ./key-bind.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];
  home.packages = with pkgs; [
    brightnessctl
  ];
}
