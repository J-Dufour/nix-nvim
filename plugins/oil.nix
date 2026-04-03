{
  plugins.oil = {
    enable = true;
    settings = {
      default_file_explorer = true;
      view_options.show_hidden = true;
    };
  };

  keymaps = [
    {
      action = "<cmd>Oil<CR>";
      key = "<leader>ee";
      mode = [ "n" ];
      options = {
        desc = "Open file explorer";
      };
    }
    {
      action.__raw = "function() require('oil').open(vim.fn.expand('%:p:h')) end";
      key = "<leader>ef";
      mode = [ "n" ];
      options = {
        desc = "Open file explorer at current file";
      };
    }
    {
      action.__raw = "function() require('oil').open() end";
      key = "<leader>er";
      mode = [ "n" ];
      options = {
        desc = "Refresh file explorer";
      };
    }
    {
      action.__raw = "function() require('oil').close() end";
      key = "<leader>ex";
      mode = [ "n" ];
      options = {
        desc = "Close file explorer";
      };
    }
  ];
}
