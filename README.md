# Nix dotfiles

[Here](./README-jp.md) is Japanese Version

This repository contains a personal desktop configuration (dotfiles) using NixOS + Home Manager.

Overview of contents:

- Modules for home-manager (`home/`)
- UI configurations for Hyprland / rofi / waybar, etc.
- `sops-nix` for secrets management

## Main Programs

| Type | Program |
| :- | :-: |
| Display Manager | SDDM |
| Editor | NixVim (Neovim) |
| File Manager | Yazi |
| Launcher | rofi |
| Notifications | Mako |
| Prompt | Starship |
| Secrets Mgmt | sops-nix |
| Shell | Zsh |
| Style Manager | stylix |
| Terminal | Ghostty |
| Window Manager | Hyprland |
| Secure Boot | lanzaboote |

## Setup (Overview)

The following is an example procedure for a new setup. Please adapt according to your environment.

1. Clone the repository

```bash
git clone https://github.com/... ~/flake
cd ~/flake
```

### Hardware Configuration (/etc/nixos/hardware-configuration.nix)

If NixOS is already installed, copy `/etc/nixos/hardware-configuration.nix` to `sub/hardware-configuration.nix`.

```bash
sudo cp /etc/nixos/hardware-configuration.nix sub/hardware-configuration.nix 
```

For a new installation, generate the file using `nixos-generate-config` in the target environment and adjust as needed.

```bash
sudo nixos-generate-config --root /mnt
# Edit before continuing with installation
```

### Secure Boot

For details, see [here](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md)

### sops-nix (Secrets Management)

This repository places `secrets/secrets.yaml` and `secrets/default.nix` to be handled by sops-nix.

Please save the keys in `.config/sops/age/keys.txt`.

```yaml
# Unencrypted secret.yaml
pass-hash: $6$... # Enter password hash here
```

### Host / User Information in the flake (e.g., hostname / username / git)

`home/default.nix` is configured to reference `specialArgs` to pass git user.name / user.email, etc. Either provide values for each host in `flake.nix` or specify an appropriate target name at runtime.

Excerpt from flake:

```nix
# flake.nix (excerpt)
outputs = { inputs, ... }:
  let
    hostname = "nixos";
    system = "x86_64-linux";
    stateVersion = "25.05";
    username = "...";
    gitUsername = "...";
    gitUseremail = "...";
  in
{
  homeConfigurations = {
    ...
  };
};
```

## Applying Configuration

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

## Hyprland Key Bindings

(For actual bindings, see `home/hyprland/key-bind.nix`.)

- Mod = Super
- Mod + Enter : Open terminal
- Mod + d : rofi launcher
- Mod + x : Close window
- Mod + f : Toggle fullscreen
- Mod + h / l / j / k : Focus movement (left/right/down/up)
- Mod + (1~0) : Move to workspace (1~0)

## Directory Structure (Excerpt)

```
.
├── flake.lock
├── flake.nix
├── README.md
├── home/
│   ├── browser.nix
│   ├── default.nix
│   ├── ghostty.nix
│   ├── hyprland/
│   │   ├── default.nix
│   │   ├── hypridle.nix
│   │   ├── hyprland.nix
│   │   ├── hyprlock.nix
│   │   └── key-bind.nix
│   ├── ime.nix
│   ├── mako.nix
│   ├── nixvim/
│   ├── rofi/
│   │   ├── default.nix
│   │   ├── powermenu.sh
│   │   └── rofi.png
│   ├── swww.nix
│   ├── terminal.nix
│   └── wallpapers/
│       └── *.jpeg
├── secrets/
│   ├── default.nix
│   └── secrets.yaml  # Place sops encrypted file here
├── stylix/
│   └── default.nix
└── sub/
    ├── boot.nix
    ├── default.nix
    ├── hardware-configuration.nix
    ├── sddm.nix
    ├── user.nix
    └── window-manager.nix
```

## Troubleshooting

- Run nixos-rebuild with detailed trace:

```bash
sudo nixos-rebuild switch --flake .#<your-username> --show-trace
```

- Check flake evaluation / update:

```bash
nix flake show
nix flake update
```