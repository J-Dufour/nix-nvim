{
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
