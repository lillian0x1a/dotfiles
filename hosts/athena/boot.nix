{ pkgs, lib, config, inputs, ... }:{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    loader = {
      systemd-boot = {
        enable = lib.mkForce false;
        configurationLimit = 20;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };
}
