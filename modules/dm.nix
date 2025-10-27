{inputs, lib, ...}:{
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
        MainColor = "#444";
        Background = lib.cleanSource ./9BD3440C.jpeg;
        AccentColor = "#fb884f";
      };
    };
  };
}