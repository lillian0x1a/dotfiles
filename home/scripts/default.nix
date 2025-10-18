{pkgs, ...}:{
  home.packages = [
    (pkgs.writeShellScriptBin "showtime.sh" ./showtime.sh)
    (pkgs.writeShellScriptBin "sysinfo.sh" ./sysinfo.sh)
  ];
}