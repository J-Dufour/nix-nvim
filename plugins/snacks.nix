{
  plugins.snacks = {
    enable = true;
    settings = {
      input.enabled = true;
      picker = {
        enabled = true;
        actions = {
          opencode_send.__raw = ''function(...) return require("opencode").snacks_picker_send(...) end'';
        };
      };
    };
  };
}
