{
  plugins.diffview = {
    enable = true;
    settings = {
      enhanced_diff_hl = true;
      view = {
        default = {
          layout = "diff2_horizontal";
          winbar_info = true;
        };
        merge_tool = {
          layout = "diff3_horizontal";
          disable_diagnostics = true;
        };
        file_history = {
          layout = "diff2_horizontal";
          winbar_info = true;
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>DiffviewOpen<cr>";
      options.desc = "Open Diffview (working tree)";
    }
    {
      mode = "n";
      key = "<leader>gh";
      action = "<cmd>DiffviewFileHistory %<cr>";
      options.desc = "File history (current file)";
    }
    {
      mode = "n";
      key = "<leader>gH";
      action = "<cmd>DiffviewFileHistory<cr>";
      options.desc = "File history (project)";
    }
    {
      mode = "n";
      key = "<leader>gx";
      action = "<cmd>DiffviewClose<cr>";
      options.desc = "Close Diffview";
    }
    {
      mode = "v";
      key = "<leader>gh";
      action = ":'<,'>DiffviewFileHistory<cr>";
      options.desc = "File history (selection)";
    }
  ];
}
