{
  opts.autoread = true;
  env.OPENCODE_CONFIG_CONTENT = builtins.readFile ./opencode-config.json;
  plugins.opencode = {
    enable = true;
    settings = {
      default_agent = "build";
      server = {
        toggle.__raw = ''
          function()
            require("opencode.terminal").toggle("opencode --port", { width = math.floor(vim.o.columns * 0.45) })
          end
        '';
        start.__raw = ''
          function()
            require("opencode.terminal").start("opencode --port", { width = math.floor(vim.o.columns * 0.45) })
          end
        '';
      };
    };
  };

  keymaps = [
    {
      action.__raw = ''function() require("opencode").ask("@this: ", { submit = true }) end'';
      key = "<C-x>";
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
      key = "<leader>ox";
      mode = [
        "n"
        "x"
      ];
      options = {
        desc = "Execute opencode action…";
      };
    }
    {
      action.__raw = ''function() require("opencode").ask("yes, continue with that", { submit = true }) end'';
      key = "<leader>oy";
      mode = [
        "n"
        "x"
      ];
      options = {
        desc = "Send opencode continue prompt";
      };
    }
    {
      action.__raw = ''function() require("opencode").toggle() end'';
      key = "<leader>oo";
      mode = [
        "n"
      ];
      options = {
        desc = "Toggle opencode";
      };
    }

  ];
}
