{pkgs, ...}:{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        # Common language servers
        bashls.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        ruff.enable = true;

        # Packages is set to null to rely on the system wide installed packages
        # this is done to avoid conflicts with the nixpkgs versions.
        gopls = {
          enable = true;
          package = null; # default pkgs.gopls
        };
        prolog_ls = {
          enable = true;
          package = null; # default pkgs.swi-prolog;
        };
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    rustaceanvim.enable = true;
  };
}
