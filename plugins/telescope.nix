{ config, pkgs, ... }:
{
  extraPackages = [
    pkgs.fd
  ];
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      live-grep-args.enable = true;
    };
    settings = {
      defaults = {
        path_display = [ "smart" ];

        mappings = {
          i = {
            "<C-k>" = {
              __raw = "require('telescope.actions').move_selection_previous";
            };
            "<C-j>" = {
              __raw = "require('telescope.actions').move_selection_next";
            };
            "<C-q>" = {
              __raw = "require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist";
            };
          };
        };
      };
    };
  };

  keymaps = [
    {
      action = "<cmd>Telescope find_files<cr>";
      key = "<leader>ff";
      mode = [ "n" ];
      options = {
        desc = "Fuzzy find files in cwd";
      };
    }
    {
      action = "<cmd>Telescope oldfiles<cr>";
      key = "<leader>fr";
      mode = [ "n" ];
      options = {
        desc = "Fuzzy find recent files";
      };
    }
    {
      action = "<cmd>Telescope live_grep<cr>";
      key = "<leader>fs";
      mode = [ "n" ];
      options = {
        desc = "Find string in cwd";
      };
    }
    {
      action = "<cmd>Telescope grep_string<cr>";
      key = "<leader>fc";
      mode = [ "n" ];
      options = {
        desc = "Find string under cursor in cwd";
      };
    }
    {
      action = "<cmd>TodoTelescope<cr>";
      key = "<leader>ft";
      mode = [ "n" ];
      options = {
        desc = "Find todos";
      };
    }

  ];
}
