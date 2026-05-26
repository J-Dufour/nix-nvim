{ pkgs, config, ... }:
{
  extraPackages = [ pkgs.tree-sitter ];
  plugins.treesitter = {
    enable = true;

    nixGrammars = true;

    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      make

      # Shells
      bash
      fish

      # Normal Languages
      c
      cpp
      rust
      java
      javascript
      typescript
      python
      go
      typst

      # Web frameworks
      svelte
      vue
      tsx

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

      # Containers
      dockerfile
    ];

    settings = {
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;

      incremental_select = {
        enable = true;

        keymaps = {
          init_selection = "<C-space>";

          node_incremental = "<C-space>";
          node_decremental = "<bs>";

          scope_incremental = false;
        };
      };
    };
  };
}
