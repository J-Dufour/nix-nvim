{ pkgs, ... }:
let
  agentic-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "agentic.nvim";
    version = "unstable-2026-03-21";
    nvimRequireCheck = [ "agentic" ];
    src = pkgs.fetchFromGitHub {
      owner = "carlos-algms";
      repo = "agentic.nvim";
      rev = "4813e54e8310b3a917d4b094d016b200b27e6d3a";
      hash = "sha256-mnTrph9JMbMVhI6MyCrgUB31TYQQMgx+8RNnfgC6JS4=";
    };
  };
in
{
  env.OPENCODE_CONFIG_CONTENT = builtins.readFile ./opencode-config.json;
  extraPlugins = [ agentic-nvim ];

  extraPackages = [
    pkgs.fd
    pkgs.ripgrep
  ];

  extraConfigLua = ''
    require("agentic").setup({
      provider = "opencode-acp",
      windows = {
        position = "right",
        width = "40%",
      },
      spinner_chars = {
        generating = { ".", "o", "O", "@", "*" },
        thinking = { "...", "***", "~~~" },
        searching = { ">", ">>", ">>>", ">>>>" },
        busy = { "-", "+", "=", "~" },
      },
      diff_preview = {
        layout = "inline",
      },
    })
  '';

  keymaps = [
    {
      action.__raw = ''function() require("agentic").toggle() end'';
      key = "<leader>at";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Toggle Agentic chat";
    }
    {
      action.__raw = ''function() require("agentic").add_selection_or_file_to_context() end'';
      key = "<C-x>";
      mode = [
        "n"
        "v"
        "i"
      ];
      options.desc = "Add selection or (if no selection) current file to Agentic";
    }
    {
      action.__raw = ''function() require("agentic").new_session() end'';
      key = "<leader>an";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Start new Agentic session";
    }
    {
      action.__raw = ''function() require("agentic").restore_session() end'';
      key = "<leader>ar";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Restore Agentic session";
    }
    {
      action.__raw = ''function() require("agentic").stop_generation() end'';
      key = "<leader>as";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Stop Agentic generation";
    }
    {
      action.__raw = ''function() require("agentic").add_current_line_diagnostics() end'';
      key = "<leader>ad";
      mode = [ "n" ];
      options.desc = "Add line diagnostics to Agentic";
    }
    {
      action.__raw = ''function() require("agentic").add_buffer_diagnostics() end'';
      key = "<leader>aD";
      mode = [ "n" ];
      options.desc = "Add buffer diagnostics to Agentic";
    }
  ];
}
