{config, modulesPath, lib, ...}:{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.availableKernelModules = [
      "btrfs"
      "ata_piix"
      "uhci_hcd"
      "virtio_pci"
      "virtio_scsi"
      "sd_mod"
      "sr_mod"
    ];
    kernelModules = [ "kvm-intel" ];
  };
}