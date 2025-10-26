{config, pkgs, ...}:{
  imports = [
    ./hardware.nix
    ../../modules/common.nix
    ../../modules/server.nix
  ];
  services.openssh = {
    enable = true;
    settings = {
      # permitRootLogin = "no";
      # passwordAuthentication = "no";
      PermitRootLogin = "prohibit-password";
    };
  };
  users.users = {
    root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIdeUZOVgX9AdWmtdQURHYEO8olP3hUMVhj4MFN0NBVM lillian@nixos"
    ];
    myuser = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIdeUZOVgX9AdWmtdQURHYEO8olP3hUMVhj4MFN0NBVM lillian@nixos"
      ];
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
  system.stateVersion = "25.05";
}