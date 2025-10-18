{pkgs, ...}:{
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      height = 300;
      border-size = 2;
      padding = 10;
      margin = 10;
      anchor = "top-right";
    };
  };
  home.packages = with pkgs; [
    libnotify
  ];
}