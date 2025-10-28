{ pkgs, lib, inputs, ... }:
let
  themes = {
    polarity = "dark";
    base16Scheme = {
      base00 = "1e1e2e"; base01 = "181825"; base02 = "313244"; base03 = "45475a";
      base04 = "585b70"; base05 = "cdd6f4"; base06 = "f5e0dc"; base07 = "ffffff";
      base08 = "f38ba8"; base09 = "f8bd96"; base0A = "f5c2e7"; base0B = "a6e3a1";
      base0C = "94e2d5"; base0D = "89b4fa"; base0E = "cba6f7"; base0F = "f2cdcd";
    };
  };
in
{
  imports = [
    # inputs.stylix.nixosModules.stylix
    inputs.stylix.homeModules.stylix
  ];
  stylix = {
    enable = true;
    image = ../home/wallpapers/FF8DA8EF.jpeg;
    base16Scheme = themes.base16Scheme;
    polarity = themes.polarity;
    cursor = {
       package = pkgs.rose-pine-hyprcursor;
       name = "BreezX-RosePine-Linux";
       size = 24;
     };
    fonts = {
      serif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Serif";
      };
      sansSerif = {
        package = pkgs.plemoljp-nf;
        name = "IBM Plex Sans";
      };
      monospace = {
        package = pkgs.plemoljp-nf;
        name = "IBM Plex Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    targets = {
      gtk.enable = true;
      qt.enable = true;
      firefox.profileNames = [ "nix" ];
      librewolf.profileNames = [ "default" ];
    };
  };
}
