{ config, pkgs, specialArgs, inputs, ... }:{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./user.nix
    ./xremap.nix
    # ../asgard/k3s.nix
  ];
  my = {
    dm.enable = true;
    sound.enable = true;
    wm.enable = true;
  };
  system.stateVersion = specialArgs.stateVersion;
  environment.systemPackages = with pkgs; [
    sops
  ];
  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
  programs.zsh.enable = true;
  services.openssh.enable = true;
}
