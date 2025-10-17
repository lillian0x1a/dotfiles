{ pkgs, config, ... }:{
  home.packages = [
    (pkgs.writeShellScriptBin "powermenu.sh" ./powermenu.sh)
  ];
  imports = [ ./theme.nix ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{name}";
      icon-theme = "Tela-circle-dracula";
    };
  };
  home.file.".config/rofi/rofi.png".source = ./rofi.png;
}
