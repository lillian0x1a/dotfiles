{ pkgs, ... }:{
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-GB"
    ];
    profiles.nix = {
      isDefault = true;
      settings = {
        "services.sync.prefs.sync.browser.uiCustomization.state" = true; # 拡張ボタンが並ぶツールバー
      };
    };
  };
  programs.librewolf = {
    enable = true;
    languagePacks = [
      "en-GB"
    ];
    settings = {
      "identity.fxaccounts.enabled" = true;
    };
  };
}
