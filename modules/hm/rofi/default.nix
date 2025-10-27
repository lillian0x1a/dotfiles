{lib, pkgs, config, ...}:
with lib;
{
  options.my-hm.rofi.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the Rofi module.";
  };
  config = mkIf config.my-hm.rofi.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "powermenu.sh" ./powermenu.sh)
    ];
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
        modi = "drun";
        show-icons = true;
        drun-display-format = "{name}";
        icon-theme = "Tela-circle-dracula";
      };
      theme = (import ./theme.nix { 
        mkLiteral = config.lib.formats.rasi.mkLiteral;
      });
    };
    home.file.".config/rofi/rofi.png".source = ./rofi.png;
  };
}
