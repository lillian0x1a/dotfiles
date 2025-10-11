{ config, pkgs, specialArgs, ... }:{
  users.users.${specialArgs.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPasswordFile =  "/run/secrets-for-users/pass-hash";
    shell = pkgs.zsh;
  };
  users.users.root = {
    hashedPasswordFile =  "/run/secrets-for-users/pass-hash";
  };
  security.sudo = {
    wheelNeedsPassword = false;
  };
}
