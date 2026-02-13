{
  plugins.opencode = {
    enable = true;
  };

  keymaps = [
    {
      action.__raw = ''function() require("opencode").ask("@this: ", { submit = true }) end'';
      key = "<C-a>";
      mode = [
        "n"
        "x"
      ];
      options = {
        desc = "Ask opencode…";
      };
    }
    {
      action.__raw = ''function() require("opencode").select() end'';
      key = "<C-x>";
      mode = [
        "n"
        "x"
      ];
      options = {
        desc = "Execute opencode action…";
      };
    }
    {
      action.__raw = ''function() require("opencode").toggle() end'';
      key = "<leader>o";

      mode = [
        "n"
        "t"
      ];
      options = {
        desc = "Toggle opencode";
      };
    }

  ];
}
