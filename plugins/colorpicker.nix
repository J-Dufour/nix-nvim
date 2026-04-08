{
  # nvim-colorizer: inline color display (highlights hex, rgb, hsl, etc.)
  plugins.nvim-colorizer = {
    enable = true;
    settings = {
      user_default_options = {
        RGB = true;
        RRGGBB = true;
        names = false;
        RRGGBBAA = true;
        AARRGGBB = false;
        rgb_fn = true;
        hsl_fn = true;
        css = false;
        css_fn = false;
        mode = "background";
        tailwind = false;
        sass = {
          enable = false;
        };
        virtualtext = "■";
        always_update = false;
      };
      filetypes = {
        "*" = { };
        css = {
          css = true;
          css_fn = true;
        };
        html = {
          names = true;
        };
        lua = { };
        nix = { };
      };
    };
  };

  # ccc: interactive color picker and changer
  plugins.ccc = {
    enable = true;
    settings = {
      highlighter = {
        auto_enable = true;
        lsp = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cp";
      action = "<cmd>CccPick<cr>";
      options.desc = "Color picker";
    }
    {
      mode = "n";
      key = "<leader>cc";
      action = "<cmd>CccConvert<cr>";
      options.desc = "Convert color";
    }
    {
      mode = "n";
      key = "<leader>ch";
      action = "<cmd>CccHighlighterToggle<cr>";
      options.desc = "Toggle color highlights";
    }
  ];
}
