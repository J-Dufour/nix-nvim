{
  plugins.blink-cmp = {
    enable = true;

    settings.keymap = {
      "<C-j>" = [
        "select_next"
        "fallback"
      ];
      "<C-k>" = [
        "select_prev"
        "fallback"
      ];
      "<C-l>" = [
        "select_and_accept"
        "fallback"
      ];
    };
  };
}
