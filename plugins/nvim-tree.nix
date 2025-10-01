{
  plugins.nvim-tree = {
    enable = true;
    settings = {
      hijack_cursor = true;
      modified.enable = true;
    };
  };

  keymaps = [
    {
      action = "<cmd>NvimTreeFocus<CR>";
      key = "<leader>ee";
      mode = [ "n" ];
      options = {
        desc = "Focus file explorer";
      };
    }
    {
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      key = "<leader>ef";
      mode = [ "n" ];
      options = {
        desc = "Toggle file explorer on current file";
      };
    }
    {
      action = "<cmd>NvimTreeCollapse<CR>";
      key = "<leader>ec";
      mode = [ "n" ];
      options = {
        desc = "Collapse file explorer";
      };
    }
    {
      action = "<cmd>NvimTreeRefresh<CR>";
      key = "<leader>er";
      mode = [ "n" ];
      options = {
        desc = "Refresh file explorer";
      };
    }
    {
      action = "<cmd>NvimTreeClose<CR>";
      key = "<leader>ex";
      mode = [ "n" ];
      options = {
        desc = "Close file explorer";
      };
    }

  ];
}
