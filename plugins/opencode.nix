{
  plugins.opencode = {
    enable = true;
  };

  keymaps = [
    {
      action.__raw = ''function() require("opencode").ask("@this: ", { submit = true }) end'';
      key = "<leader>oa";
      mode = [
        "n"
      ];
      options = {
        desc = "Ask opencode…";
      };
    }
    {
      action.__raw = ''function() require("opencode").select() end'';
      key = "<leader>ox";
      mode = [
        "n"
      ];
      options = {
        desc = "Execute opencode action…";
      };
    }
    {
      action.__raw = ''function() require("opencode").toggle() end'';
      key = "<C-Space>";
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
