{
  plugins.conform-nvim = {
    enable = true;

    settings = {
      formatters_by_ft = {
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        javascriptreact = [ "prettier" ];
        typescriptreact = [ "prettier" ];
        svelte = [ "prettier" ];
        css = [ "prettier" ];
        html = [ "prettier" ];
        json = [ "prettier" ];
        yaml = [ "prettier" ];
        markdown = [ "prettier" ];
        graphql = [ "prettier" ];
        liquid = [ "prettier" ];
        lua = [ "stylua" ];
        python = [
          "isort"
          "black"
        ];
        nix = [ "nixfmt" ];
        go = [ "gofmt" ];
        rust = [ "rustfmt" ];
        c = [ "clang-format" ];
      };

      format_on_save = {
        lsp_fallback = true;
        async = false;
        timeout_ms = 1000;
      };
    };
  };
}
