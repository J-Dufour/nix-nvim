{ pkgs, ... }:
{
  lsp = {
    inlayHints.enable = true;
    servers = {
      "*".config = {
        capabilities = {
          textDocument = {
            semanticTokens = {
              multilineTokenSupport = true;
            };
          };
        };
        root_markers = [
          ".git"
        ];
      };
      gopls = {
        enable = true;
        config = {
          cmd = [ "${pkgs.gopls}/bin/gopls" ];
          filetypes = [
            "go"
            "gomod"
          ];
        };
      };
      rust_analyzer = {
        enable = true;

        config = {
          cmd = [ "${pkgs.rust-analyzer}/bin/rust-analyzer" ];
          filetypes = [ "rust" ];
          cargo.cfgs = [
            "target_family"
          ];
        };
      };

      ts_ls = {
        enable = true;
        config = {
          cmd = [
            "${pkgs.typescript-language-server}/bin/typescript-language-server"
            "--stdio"
          ];
          filetypes = [
            "typescript"
            "javascript"
            "typescriptreact"
            "javascriptreact"
          ];
        };
      };
      eslint = {
        enable = true;
        config = {
          cmd = [
            "${pkgs.vscode-langservers-extracted}/bin/vscode-eslint-language-server"
            "--stdio"
          ];
          filetypes = [
            "typescript"
            "javascript"
            "typescriptreact"
            "javascriptreact"
            "svelte"
          ];
        };
      };

      svelte = {
        enable = true;
        config = {
          cmd = [
            "${pkgs.svelte-language-server}/bin/svelteserver"
            "--stdio"
          ];
          filetypes = [ "svelte" ];
        };
      };

      nil_ls = {
        enable = true;
        config = {
          cmd = [ "${pkgs.nil}/bin/nil" ];
          filetypes = [ "nix" ];
        };
      };

      clangd = {
        enable = true;
        config = {
          cmd = [ "${pkgs.clang-tools}/bin/clangd" ];
          filetypes = [
            "c"
            "cpp"
            "objc"
            "objcpp"
            "cuda"
            "proto"
          ];
        };
      };

      # ccls = {enable = true; config = {}; };

      sqruff = {
        enable = true;
        config = {
          cmd = [
            "${pkgs.sqruff}/bin/sqruff"
            "lsp"
          ];
          filetypes = [ "sql" ];
        };
      };
      tinymist = {
        enable = true;
        config = {
          cmd = [ "${pkgs.tinymist}/bin/tinymist" ];
          filetypes = [ "typst" ];
        };
      };

      ty = {
        enable = true;
        config = {
          cmd = [
            "${pkgs.ty}/bin/ty"
            "server"
          ];
          filetypes = [ "python" ];
        };
      };

      jdtls = {
        enable = true;
        config = {
          cmd = [ "${pkgs.jdt-language-server}/bin/jdtls" ];
          filetypes = [ "java" ];
          java.inlayHints.parameterNames = "all";
        };
      };

    };
  };
}
