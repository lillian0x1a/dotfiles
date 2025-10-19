# Nix dotfiles

このリポジトリは NixOS + Home Manager を使った個人用デスクトップ設定（ dotfiles ）です。

内容の概要:

- home-manager 用モジュール ( `home/` )
- Hyprland / rofi / waybar などの UI 設定
- シークレット管理のための `sops-nix`

## 主なプログラム

| Type | Program |
| :- | :-: |
| Display Manager | SDDM |
| Editor | NixVim (Neovim) |
| File Manager | Yazi |
| Launcher | rofi |
| Notifications | Swaync |
| Prompt | Starship |
| Secrets Mgmt | sops-nix |
| Shell | Zsh |
| Style Manager | stylix |
| Terminal | Ghostty |
| Window Manager | Hyprland |
| Secure Boot | lanzaboote |

## セットアップ（ 概略 ）

以下は新規セットアップの手順例です。環境に合わせて読み替えてください。

1. リポジトリをクローン

```bash
git clone https://github.com/lillian0x1a/dotfiles ~/flake
cd ~/flake
```

### ハードウェア設定 (/etc/nixos/hardware-configuration.nix)

既に NixOS が入っている場合は `/etc/nixos/hardware-configuration.nix` を `sub/hardware-configuration.nix` にコピー。

```bash
sudo cp /etc/nixos/hardware-configuration.nix sub/hardware-configuration.nix 
```

新規インストール時はターゲット環境で `nixos-generate-config` を使って生成されたファイルを調整してください。

```bash
sudo nixos-generate-config --root /mnt
# 編集してからインストール続行
```

### セキュアブート

詳細は[こちら](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md)

### sops-nix（シークレット管理）

このリポジトリでは `secrets/secrets.yaml` と `secrets/default.nix` を配置して sops-nix で扱います。

鍵は `.config/sops/age/keys.txt` に保存してください。


```yaml
# 暗号化前のsecret.yaml
pass-hash: $6$... #ここにパスワードのハッシュを入力 
```

### flake 側でのホスト / ユーザー情報（例: hostname / username / git）

`home/default.nix` は `specialArgs` を参照して git の user.name / user.email などを渡す構成になっています。`flake.nix` でホストごとに値を与えるか、実行時に適切なターゲット名を指定してください。

flake の抜粋 :

```nix
# flake.nix (抜粋)
outputs = { inputs, ... }:
  let
    hostname = "nixos";
    system = "x86_64-linux";
    stateVersion = "25.05";
    username = "lillian";
    gitUsername = "lillian0x";
    gitUseremail = "183957662+lillian0x1a@users.noreply.github.com";
  in
{
  homeConfigurations = {
    ...
  };
};
```

## 設定の適用

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

## Hyprland キーバインド

（実際のバインドは `home/hyprland/key-bind.nix` を参照。）

- Mod = Super
- Mod + Enter : ターミナルを開く
- Mod + d : rofi ランチャー
- Mod + x : ウィンドウ閉じる
- Mod + f : フルスクリーン切替
- Mod + h / l / j / k : フォーカス移動（左/右/下/上）

## ディレクトリ構成（抜粋）

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
│   └── secrets.yaml  # sops で暗号化されたファイルを置く
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

## トラブルシューティング

- 詳細トレース付きで nixos-rebuild を実行する:

```bash
sudo nixos-rebuild switch --flake .#<your-username> --show-trace
```

- flake の評価確認 / 更新:

```bash
nix flake show
nix flake update
```
