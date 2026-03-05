{
  plugins.neogit = {
    enable = true;
    settings = {
      integrations = {
        telescope = true;
      };

      signs = {
        hunk = [
          ""
          ""
        ];
        item = [
          "+"
          "-"
        ];
        section = [
          "+"
          "-"
        ];
      };
    };

    keymaps = [
      {
        action = "<cmd>Neogit<cr>";
        key = "<leader>gg";
        mode = [ "n" ];
        options.desc = "Open Neogit";
      }
    ];
  };
}
