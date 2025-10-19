{ specialArgs, inputs, ... }:{
  home-manager.backupFileExtension = "backup";
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { 
    inherit inputs specialArgs;
  };
  home-manager.users.${specialArgs.username} = { pkgs, lib, inputs, ... }:{
    imports = [
      inputs.nixvim.homeManagerModules.nixvim
      ./eww
      ./hyprland
      ./nixvim
      ./rofi
      ./scripts
      ./browser.nix
      ./ghostty.nix
      ./ime.nix
      ./mako.nix
      ./sound.nix
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
      vscode
    ];
    programs.home-manager.enable = true;
  };
}
