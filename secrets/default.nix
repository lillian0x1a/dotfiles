{ pkgs, specialArgs, ...}:
let
  ageKeyFile = "/home/${specialArgs.username}/.config/sops/age/keys.txt";
in
{
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