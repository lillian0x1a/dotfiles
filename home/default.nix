{ specialArgs, inputs, ... }:{
  home-manager.backupFileExtension = "backup";
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.${specialArgs.username} = { pkgs, lib, inputs, ... }:{
    imports = [
      inputs.stylix.homeModules.stylix
      ./hyprland
      ./rofi
      ./wlogout
      ./swww.nix
      ./waybar
      ./browser.nix
      ./terminal.nix
      ./ime.nix
      ./wofi.nix
      ../stylix
    ];
    nixpkgs.config = {
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "vscode"
      ];
    };
    home.stateVersion = specialArgs.stateVersion;
    home.sessionVariables = {
      GIT_ASKPASS = "";
      SSH_ASKPASS = "";
    };
    home.packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      fira-code
      nerd-fonts.fira-code
      vscode
    ];
    services.mako = {
      enable = true;
    };
    programs = {
      home-manager.enable = true;
      git = {
        enable = true;
        userName = specialArgs.gitUsername;
        userEmail = specialArgs.gitUseremail;
        extraConfig = {
          init.defaultBranch = "main";
        };
      };
      ghostty = {
        enable = true;
        enableZshIntegration = true;
      };
      zed-editor = {
        enable = true;
        userSettings = {
          vim_mode = true;
        };
      };
    };
  };
}
