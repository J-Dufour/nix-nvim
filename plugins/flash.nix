{ ... }:
{
  plugins.flash = {
    enable = true;
    settings = {
      # Character labels used for jump targets
      labels = "asdfghjklqwertyuiop";

      search = {
        # Search across all visible windows
        multi_window = true;
        forward = true;
        wrap = true;
      };

      jump = {
        # Don't autojump even if only one match
        autojump = false;
      };

      modes = {
        # Enhanced f/t/F/T motions with visible jump labels
        char = {
          enabled = true;
          # Show labels when there are multiple targets
          jump_labels = true;
          # Only match on the current line
          multi_line = false;
        };

        # Flash appears automatically during / and ? searches
        search.enabled = true;

        # S key: visually select treesitter nodes
        treesitter = {
          labels = "asdfghjklqwertyuiop";
          jump.pos = "range";
          search.incremental = false;
          label = {
            before = true;
            after = true;
            style = "inline";
          };
          highlight = {
            backdrop = false;
            matches = false;
          };
        };

        treesitter_search = {
          jump.pos = "range";
          search = {
            multi_window = true;
            wrap = true;
            incremental = false;
          };
          remote_op.restore = true;
          label.before = true;
        };

        # r key (operator-pending): perform operation at a distant location then jump back
        remote = {
          remote_op = {
            restore = true;
            motion = true;
          };
        };
      };
    };
  };

  keymaps = [
    # s — jump anywhere on screen with 2-3 keystrokes
    {
      action.__raw = ''function() require("flash").jump() end'';
      key = "s";
      mode = [
        "n"
        "x"
        "o"
      ];
      options.desc = "Flash: jump to location";
    }
    # S — select a treesitter node visually (normal and operator-pending only;
    #     visual mode is intentionally omitted to avoid conflict with nvim-surround's S)
    {
      action.__raw = ''function() require("flash").treesitter() end'';
      key = "S";
      mode = [
        "n"
        "o"
      ];
      options.desc = "Flash: select treesitter node";
    }
    # r (operator-pending) — perform an operation at a remote location then return
    {
      action.__raw = ''function() require("flash").remote() end'';
      key = "r";
      mode = [ "o" ];
      options.desc = "Flash: remote action";
    }
    # R — treesitter-aware remote search
    {
      action.__raw = ''function() require("flash").treesitter_search() end'';
      key = "R";
      mode = [
        "o"
        "x"
      ];
      options.desc = "Flash: treesitter remote search";
    }
    # <C-s> in command mode — toggle flash highlighting during / and ? searches
    {
      action.__raw = ''function() require("flash").toggle() end'';
      key = "<C-s>";
      mode = [ "c" ];
      options.desc = "Flash: toggle in search";
    }
  ];
}
