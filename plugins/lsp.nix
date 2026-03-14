{
  plugins.lsp-format = {
    enable = true;
    autoLoad = true;
  };

  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      gopls.enable = true;
      rust_analyzer = {
        enable = true;
        installRustc = false;
        installCargo = false;

        settings = {
          cargo.cfgs = [
            "target_family"
          ];
        };
      };

      ts_ls.enable = true;
      eslint.enable = true;

      svelte.enable = true;

      nil_ls.enable = true;

      clangd.enable = true;

      # ccls.enable = true;

      sqruff.enable = true;

      ty.enable = true;

      jdtls = {
        enable = true;
        settings = {
          java.inlayHints.parameterNames = "all";
        };
      };

    };
  };
}
