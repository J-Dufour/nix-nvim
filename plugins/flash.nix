{
  plugins.flash = {
    enable = true;
    settings = {
      # Highlight settings for flash labels and search matches
      highlight = {
        backdrop = true;
      };
      # Labels used for jump targets
      labels = "asdfghjklqwertyuiopzxcvbnm";
      # Search configuration
      search = {
        mode = "fuzzy";
        incremental = false;
      };
      # Jump configuration
      jump = {
        autojump = true;
      };
      # Modes configuration
      modes = {
        char = {
          jump_labels = true;
          multi_line = false;
        };
      };
    };
  };

  keymaps = [
    # Normal, visual, operator-pending: jump to any location
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action.__raw = "function() require('flash').jump() end";
      options = {
        desc = "Flash jump";
        nowait = true;
      };
    }
    # Normal, visual, operator-pending: Treesitter-aware node selection
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "S";
      action.__raw = "function() require('flash').treesitter() end";
      options.desc = "Flash treesitter select";
    }
    # Operator-pending: jump and apply operator from a distance
    {
      mode = "o";
      key = "r";
      action.__raw = "function() require('flash').remote() end";
      options.desc = "Flash remote";
    }
    # Normal, visual, operator-pending: Treesitter search across the buffer
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "<leader>js";
      action.__raw = "function() require('flash').jump({ search = { mode = 'search' } }) end";
      options.desc = "Flash search mode";
    }
  ];
}
