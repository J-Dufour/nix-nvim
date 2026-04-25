{ pkgs, ... }:
let
  default_root_markers = [
    "Makefile"
    ".git"
  ];
in
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
        root_markers = default_root_markers;
      };
      gopls = {
        enable = true;
        config = {
          cmd = [ "${pkgs.gopls}/bin/gopls" ];
          filetypes = [
            "go"
            "gomod"
          ];
          root_markers = [ "go.mod" ] ++ default_root_markers;
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
          root_markers = [ "Cargo.toml" ] ++ default_root_markers;
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
          root_markers = [
            "tsconfig.json"
            "package.json"
          ]
          ++ default_root_markers;
        };
      };
      eslint = {
        enable = true;
        config = {
          cmd = [
            "${pkgs.vscode-langservers-extracted}/bin/vscode-eslint-language-server"
            "--stdio"
          ];
          settings = {
            useFlatConfig = true;
            experimental.useFlatConfig = false;
            nodePath = "";
          };
          filetypes = [
            "typescript"
            "javascript"
            "typescriptreact"
            "javascriptreact"
            "svelte"
          ];
          root_markers = [
            "eslint.config.js"
            "eslint.config.cjs"
            "eslint.config.mjs"
            "eslint.config.ts"
            "eslint.config.cts"
            "eslint.config.mts"
            "package.json"
          ]
          ++ default_root_markers;
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
          root_markers = [
            "svelte.config.js"
            "package.json"
          ]
          ++ default_root_markers;
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
          root_markers = [
            "compile_commands.json"
            ".clangd"
          ]
          ++ default_root_markers;
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
          root_markers = [
            "pyproject.toml"
            "requirements.txt"
          ];
        };
      };

      jdtls = {
        enable = true;
        config = {
          cmd = [ "${pkgs.jdt-language-server}/bin/jdtls" ];
          filetypes = [ "java" ];
          java.inlayHints.parameterNames = "all";
          root_markers = [
            "pom.xml"
            "build.gradle"
            "build.gradle.kts"
            "settings.gradle"
            "settings.gradle.kts"
            "gradlew"
            ".mvn"
            "mvnw"
            "build.xml"
            ".classpath"
            ".project"
          ];
        };
      };

    };
  };
}
