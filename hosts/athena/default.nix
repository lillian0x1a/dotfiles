{ config, pkgs, specialArgs, inputs, ... }:{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./user.nix
    ./xremap.nix
    ../../modules/common.nix
    ../../modules/dm.nix
    ../../modules/sound.nix
    ../../modules/wm.nix
  ];
  system.stateVersion = specialArgs.stateVersion;
  environment.systemPackages = with pkgs; [
    sops
  ];
  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
  programs.zsh.enable = true;
  services.openssh.enable = true;
}
