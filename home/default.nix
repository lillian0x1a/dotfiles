{ specialArgs, inputs, ... }:{
  home-manager.backupFileExtension = "backup";
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { 
    inherit inputs specialArgs;
  };
  home-manager.users.${specialArgs.username} = { pkgs, lib, inputs, ... }:{
    imports = [
      inputs.nixvim.homeManagerModules.nixvim
      ./nixvim
      ./rofi
      ./scripts
      ./browser.nix
      ./ghostty.nix
      ./sound.nix
      ./swaync.nix
      ./swww.nix
      ./terminal.nix
      ../modules/hm
      ../stylix
    ];
    my-hm = {
      eww.enable = true;
      hyprland.enable = true;
      hypridle.enable = true;
      hyprlock.enable = true;
      ime.enable = true;
    };
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
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
  };
}
