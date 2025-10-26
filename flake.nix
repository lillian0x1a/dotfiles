{
  description = "A declarative NixOS system configuration using Flakes";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    hm = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    sddm-sugar-candy = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap.url = "github:xremap/nix-flake";
  };
  outputs = inputs@{nixpkgs, hm, disko, ...}:
  let
    system = "x86_64-linux";
    stateVersion = "25.05";
    username = "lillian";
    gitUsername = "lillian0x";
    gitUseremail = "183957662+lillian0x1a@users.noreply.github.com";
  in
  {
    nixosConfigurations = {
      athena = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          hostname = "athena";
          inherit system stateVersion username gitUsername gitUseremail inputs;
        };
        modules = [
          hm.nixosModules.home-manager
          ./home
          ./hosts/athena
          ./secrets
        ];
      };
      asgard = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { hostname = "asgard"; };
        modules = [
          disko.nixosModules.disko
          ./hosts/asgard/configuration.nix
          ./hosts/asgard/disko.nix
        ];
      };
    };
  };
}
