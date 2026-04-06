{
  plugins.flash = {
    enable = true;
  };

  keymaps = [
    {
      action.__raw = ''function() require("flash").jump() end'';
      key = "s";
      mode = [
        "n"
        "x"
        "o"
      ];
      options.desc = "Flash: jump to label";
    }
    {
      action.__raw = ''function() require("flash").treesitter() end'';
      key = "S";
      mode = [
        "n"
        "x"
        "o"
      ];
      options.desc = "Flash: jump to treesitter node";
    }
    {
      action.__raw = ''function() require("flash").remote() end'';
      key = "r";
      mode = [ "o" ];
      options.desc = "Flash: remote jump (operator-pending)";
    }
    {
      action.__raw = ''function() require("flash").treesitter_search() end'';
      key = "R";
      mode = [
        "o"
        "x"
      ];
      options.desc = "Flash: treesitter search";
    }
    {
      action.__raw = ''function() require("flash").toggle() end'';
      key = "<C-s>";
      mode = [ "c" ];
      options.desc = "Flash: toggle flash search";
    }
  ];
}
