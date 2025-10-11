{ config, pkgs, specialArgs, inputs, ... }:{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./window-manager.nix
    ./user.nix
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
  nixpkgs.overlays = [ inputs.sddm-sugar-candy-nix.overlays.default ];
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
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      sugarCandyNix = {
        enable = true;
        settings = {
          FormPosition = "right";
          Background = "${builtins.toString ../home/wallpapers/D894C384.jpeg}";
        };
      };
    };
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
