{
  networking.firewall.allowedTCPPorts = [
    6443
  ];
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString [
    # "--debug" # Optionally add additional args to k3s
    "--disable=traefik"
    "--write-kubeconfig-mode=644"
    ];
  };
}