{ pkgs, ... }:{
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-GB"
    ];
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
