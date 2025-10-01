{ config, pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;

    settings = {
      highlight.enable = true;
      indent.enable = true;

      incremental_select = {
        enable = true;

        keymaps = {
          init_selection = "<C-space>";

          node_incremental = "<C-space>";
          node_decremental = "<bs>";

          scope_incremental = false;
        };
      };

      nixGrammars = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        make

        # Shells
        bash
        fish

        # Normal Languages
        rust
        java
        javascript
        typescript
        python
        go

        # Web frameworks
        svelte
        vue

        # Config... ish?
        lua
        nix
        vim

        # Markup / Config
        html
        json
        toml
        yaml
        xml

        # Git
        gitignore
        gitcommit
        git_rebase
      ];

    };
  };
}
