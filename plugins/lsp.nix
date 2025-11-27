{
  plugins.lsp-format = {
    enable = true;
    autoLoad = true;
  };

  plugins.lsp = {
    enable = true;
    servers = {
      gopls.enable = true;
      rust_analyzer = {
        enable = true;
        installRustc = false;
        installCargo = false;
      };
      ts_ls.enable = true;

      svelte.enable = true;

      nil_ls.enable = true;

      # clangd.enable = true;

      ccls.enable = true;

    };
  };
}
