{ config, pkgs, specialArgs, inputs, ... }:{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./sddm.nix
    ./user.nix
    ./window-manager.nix
  ];
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  system.stateVersion = specialArgs.stateVersion;
  environment.systemPackages = with pkgs; [
    sops
  ];
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "en_GB.UTF-8";
  networking = {
    hostName = specialArgs.hostname;
    networkmanager.enable = true;
  };
  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
  programs.zsh.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };
}
