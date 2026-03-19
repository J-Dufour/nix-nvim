{
  plugins.gitsigns = {
    enable = true;
  };

  keymaps = [
    # Navigation
    {
      mode = "n";
      key = "]h";
      action.__raw = "function() require('gitsigns').next_hunk() end";
      options.desc = "Next hunk";
    }
    {
      mode = "n";
      key = "[h";
      action.__raw = "function() require('gitsigns').prev_hunk() end";
      options.desc = "Prev hunk";
    }

    # View
    {
      mode = "n";
      key = "<leader>hp";
      action.__raw = "function() require('gitsigns').preview_hunk_inline() end";
      options.desc = "Preview hunk inline";
    }
    {
      mode = "n";
      key = "<leader>hP";
      action.__raw = "function() require('gitsigns').preview_hunk() end";
      options.desc = "Preview hunk";
    }

    # Stage / unstage
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>hs";
      action.__raw = "function() require('gitsigns').stage_hunk() end";
      options.desc = "Stage hunk";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>hr";
      action.__raw = "function() require('gitsigns').reset_hunk() end";
      options.desc = "Reset hunk";
    }
    {
      mode = "n";
      key = "<leader>hS";
      action.__raw = "function() require('gitsigns').stage_buffer() end";
      options.desc = "Stage buffer";
    }
    {
      mode = "n";
      key = "<leader>hR";
      action.__raw = "function() require('gitsigns').reset_buffer() end";
      options.desc = "Reset buffer";
    }
    {
      mode = "n";
      key = "<leader>hu";
      action.__raw = "function() require('gitsigns').undo_stage_hunk() end";
      options.desc = "Undo stage hunk";
    }

    # Blame
    {
      mode = "n";
      key = "<leader>hb";
      action.__raw = "function() require('gitsigns').blame_line({ full = true }) end";
      options.desc = "Blame line (full)";
    }
    {
      mode = "n";
      key = "<leader>hB";
      action.__raw = "function() require('gitsigns').toggle_current_line_blame() end";
      options.desc = "Toggle line blame";
    }

    # Diff
    {
      mode = "n";
      key = "<leader>hd";
      action.__raw = "function() require('gitsigns').diffthis() end";
      options.desc = "Diff this (index)";
    }
    {
      mode = "n";
      key = "<leader>hD";
      action.__raw = "function() require('gitsigns').diffthis('~') end";
      options.desc = "Diff this (last commit)";
    }

    # Text object
    {
      mode = [
        "o"
        "x"
      ];
      key = "ih";
      action.__raw = "function() require('gitsigns').select_hunk() end";
      options.desc = "Select hunk";
    }
  ];
}
