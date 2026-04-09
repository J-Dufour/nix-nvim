{
  # Harpoon: mark up to 4 frequently-used files and jump to them instantly.
  # Complements telescope (find any file) with O(1) access to your hottest files.
  plugins.harpoon = {
    enable = true;
    # Wire harpoon into telescope so you can fuzzy-search your marked files
    enableTelescope = true;
  };

  keymaps = [
    # Mark the current buffer
    {
      mode = [ "n" ];
      key = "<leader>ma";
      action.__raw = "function() require('harpoon'):list():add() end";
      options.desc = "Harpoon: mark file";
    }

    # Open the quick-menu to view/edit/reorder marks
    {
      mode = [ "n" ];
      key = "<leader>mm";
      action.__raw = ''
        function()
          local h = require('harpoon')
          h.ui:toggle_quick_menu(h:list())
        end
      '';
      options.desc = "Harpoon: toggle menu";
    }

    # Browse marks via telescope
    {
      mode = [ "n" ];
      key = "<leader>mf";
      action = "<cmd>Telescope harpoon marks<cr>";
      options.desc = "Harpoon: find marks (telescope)";
    }

    # Jump directly to marks 1-4
    {
      mode = [ "n" ];
      key = "<leader>m1";
      action.__raw = "function() require('harpoon'):list():select(1) end";
      options.desc = "Harpoon: go to file 1";
    }
    {
      mode = [ "n" ];
      key = "<leader>m2";
      action.__raw = "function() require('harpoon'):list():select(2) end";
      options.desc = "Harpoon: go to file 2";
    }
    {
      mode = [ "n" ];
      key = "<leader>m3";
      action.__raw = "function() require('harpoon'):list():select(3) end";
      options.desc = "Harpoon: go to file 3";
    }
    {
      mode = [ "n" ];
      key = "<leader>m4";
      action.__raw = "function() require('harpoon'):list():select(4) end";
      options.desc = "Harpoon: go to file 4";
    }

    # Cycle through marks without opening the menu
    {
      mode = [ "n" ];
      key = "<leader>mn";
      action.__raw = "function() require('harpoon'):list():next() end";
      options.desc = "Harpoon: next mark";
    }
    {
      mode = [ "n" ];
      key = "<leader>mp";
      action.__raw = "function() require('harpoon'):list():prev() end";
      options.desc = "Harpoon: prev mark";
    }
  ];
}
