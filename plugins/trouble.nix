{
  plugins.trouble = {
    enable = true;
  };

  keymaps = [
    {
      action = "<cmd>Trouble diagnostics toggle<cr>";
      key = "<leader>xx";
      mode = [ "n" ];
      options = {
        desc = "Toggle Trouble diagnostics";
      };
    }
  ];
}
