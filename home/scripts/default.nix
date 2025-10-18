{pkgs, ...}:{
  home.packages = [
    (pkgs.writeShellScriptBin "sysinfo.sh" ./sysinfo.sh)
  ];
}