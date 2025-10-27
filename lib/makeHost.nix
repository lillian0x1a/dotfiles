{ nixpkgs, system, commonSpecialArgs }:
{ name, extraArgs ? {}, modules }:
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = commonSpecialArgs // { hostname = name; } // extraArgs;
  modules = modules;
}
