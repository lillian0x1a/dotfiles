{config, pkgs, specialArgs, ...}:{
  imports = [
    ./hardware.nix
    ../../modules/common.nix
    ../../modules/server.nix
  ];
  my = {
    server = {
      enable = true;
      ipAddress = specialArgs.ipAddress;
      defaultGateway = specialArgs.defaultGateway;
    };
  };
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "prohibit-password";
  };
  users.users = {
    root.openssh.authorizedKeys.keys = specialArgs.sshKeys;
    ${specialArgs.username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = specialArgs.sshKeys;
    };
  };
  environment.systemPackages = with pkgs; [
    neovim
    git
    jq
    curl
  ];
  security.sudo.wheelNeedsPassword = false;
  system.autoUpgrade.enable = false;
  system.stateVersion = specialArgs.stateVersion;
}