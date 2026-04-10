{
  lsp = {
    inlayHints.enable = true;
    servers = {
      gopls.enable = true;
      rust_analyzer = {
        enable = true;

        config = {
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
      tinymist.enable = true;

      ty.enable = true;

      jdtls = {
        enable = true;
        config = {
          java.inlayHints.parameterNames = "all";
        };
      };

    };
  };
}
