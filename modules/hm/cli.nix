{lib, config, pkgs, specialArgs, ... }:
with lib;
{
  options.my-hm.cli.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the CLI module.";
  };
  config = mkIf config.my-hm.cli.enable {
    programs.git = {
      enable = true;
      userName = specialArgs.gitUsername;
      userEmail = specialArgs.gitUseremail;
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      autocd = true;
      shellAliases = {
        ls = "eza -a --icons";
        tree = "eza --tree --icons";
      };
    };
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.eza = {
      enable = true;
      icons = "auto";
      enableZshIntegration = true;
    };
    programs.yazi = {
      enable = true;
    };
  };
}