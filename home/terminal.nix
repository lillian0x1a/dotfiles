{ pkgs, ... }:{
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
}
