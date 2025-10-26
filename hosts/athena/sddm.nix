{inputs, ...}:{
  imports = [
    inputs.sddm-sugar-candy.nixosModules.default
  ];
  nixpkgs.overlays = [ inputs.sddm-sugar-candy.overlays.default ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    sugarCandyNix = {
      enable = true;
      settings = {
        FormPosition = "right";
        Background = "${builtins.toString ../../home/wallpapers/D894C384.jpeg}";
      };
    };
  };
}