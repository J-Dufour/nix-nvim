{
  plugins.codecompanion = {
    enable = true;
    settings = {
      adapters = {
        http.anthropic.__raw = ''
              function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "cmd:pass LLMS/anthropic 2>/dev/null",
              },
            })
          end
        '';
      };
      interactions = {
        chat.adapter = {
          name = "anthropic";
          model = "claude-opus-4-6";
        };
        inline.adapter = "anthropic";
      };
      display = {
        chat.window.opts = {
          wrap = false;
        };
      };
    };
  };

  keymaps = [
    {
      action = "<cmd>CodeCompanionChat Toggle<cr>";
      key = "<leader>cc";
      mode = [ "n" ];
      options.desc = "Toggle CodeCompanion Chat";
    }
    {
      action = ":CodeCompanion ";
      key = "<leader>ci";
      mode = [
        "n"
        "x"
      ];
      options.desc = "Start CodeCompanion Inline";
    }
  ];
}
