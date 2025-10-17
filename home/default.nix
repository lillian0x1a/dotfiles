{ specialArgs, inputs, ... }:{
  home-manager.backupFileExtension = "backup";
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { 
    inherit inputs specialArgs;
  };
  home-manager.users.${specialArgs.username} = { pkgs, lib, inputs, ... }:{
    imports = [
      inputs.nixvim.homeManagerModules.nixvim
      ./hyprland
      ./nixvim
      ./rofi
      ./waybar
      ./browser.nix
      ./ghostty.nix
      ./ime.nix
      ./mako.nix
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
    programs.home-manager.enable = true;
  };
}
