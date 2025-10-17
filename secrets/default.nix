{ pkgs, specialArgs, inputs, ...}:
let
  ageKeyFile = "/home/${specialArgs.username}/.config/sops/age/keys.txt";
in
{
  imports = [
    inputs.sops.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = ageKeyFile;
    secrets.pass-hash = {
      sopsFile = ./secrets.yaml;
      neededForUsers = true;
    };
  };
}