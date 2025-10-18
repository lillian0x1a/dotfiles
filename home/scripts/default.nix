{pkgs, ...}:{
  home.packages = [
    (pkgs.writeShellScriptBin "battery-notify.sh" ./battery-notify.sh)
    (pkgs.writeShellScriptBin "showtime.sh" ./showtime.sh)
    (pkgs.writeShellScriptBin "sysinfo.sh" ./sysinfo.sh)
  ];
}