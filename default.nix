{ options, config, ... }:
{

  # enable = true;
  # defaultEditor = true;

  globals = {
    mapleader = " ";
  };

  opts = {

    termguicolors = true;

    relativenumber = true;
    number = true;

    wrap = false;

    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;

    ignorecase = true;
    smartcase = true;

    signcolumn = "yes";

    backspace = "indent,eol,start";

    splitright = true;
    splitbelow = true;
  };

  colorscheme = "everforest";
  colorschemes.everforest = {
    enable = true;
    settings.transparent_background = 1;
  };

  keymaps = [
    {
      action = ":nohl<CR>";
      key = "<leader>nh";
      mode = [ "n" ];
      options = {
        desc = "Clear search highlights";
      };
    }
    {
      action = "<C-w>v";
      key = "<leader>sv";
      mode = [ "n" ];
      options = {
        desc = "Split window vertically";
      };
    }
    {
      action = "<C-w>s";
      key = "<leader>sh";
      mode = [ "n" ];
      options = {
        desc = "Split window horizontally";
      };
    }
    {
      action = "<C-w>=";
      key = "<leader>se";
      mode = [ "n" ];
      options = {
        desc = "Equalize splits";
      };
    }
    {
      action = "<cmd>close<CR>";
      key = "<leader>sx";
      mode = [ "n" ];
      options = {
        desc = "Close split";
      };
    }
    {
      action = "<cmd>tabnew<CR>";
      key = "<leader>to";
      mode = [ "n" ];
      options = {
        desc = "Open new tab";
      };
    }
    {
      action = "<cmd>tabclose<CR>";
      key = "<leader>tx";
      mode = [ "n" ];
      options = {
        desc = "Close current tab";
      };
    }
    {
      action = "<cmd>tabn<CR>";
      key = "<leader>tn";
      mode = [ "n" ];
      options = {
        desc = "Go to next tab";
      };
    }
    {
      action = "<cmd>tabp<CR>";
      key = "<leader>tp";
      mode = [ "n" ];
      options = {
        desc = "Go to previous tab";
      };
    }
    {
      action = "<cmd>tabnew %<CR";
      key = "<leader>tf";
      mode = [ "n" ];
      options = {
        desc = "Open current buffer in new tab";
      };
    }
  ];

  imports = [
    ./plugins
  ];

}
