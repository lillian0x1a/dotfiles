{
  description = "A declarative NixOS system configuration using Flakes";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, hyprland, sddm-sugar-candy-nix, stylix, sops-nix, ... }@inputs:
  let
    hostname = "nixos";
    system = "x86_64-linux";
    stateVersion = "25.05";
    username = "lillian";
    gitUsername = "lillian0x";
    gitUseremail = "183957662+lillian0x1a@users.noreply.github.com";
  in
  {
    nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit hostname system stateVersion username gitUsername gitUseremail inputs;
      };
      modules = [
        stylix.nixosModules.stylix
        sddm-sugar-candy-nix.nixosModules.default
        home-manager.nixosModules.home-manager
        sops-nix.nixosModules.sops
        ./sub
        ./home
        ./secrets
      ];
    };
  };
}
