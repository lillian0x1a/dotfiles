{ specialArgs, inputs, ... }:{
  home-manager.backupFileExtension = "backup";
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { 
    inherit inputs specialArgs;
  };
  home-manager.users.${specialArgs.username} = { pkgs, lib, inputs, ... }:{
    imports = [
      inputs.stylix.homeModules.stylix
      inputs.nixvim.homeManagerModules.nixvim
      ./hyprland
      ./nixvim
      ./rofi
      ./waybar
      ./wlogout
      ./browser.nix
      ./ime.nix
      ./swww.nix
      ./terminal.nix
      ../stylix
    ];
    nixpkgs.config = {
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "vscode"
      ];
    };
    home.stateVersion = specialArgs.stateVersion;
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
    programs.home-manager.enable = true;
  };
}
