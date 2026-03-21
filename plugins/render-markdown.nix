{
  plugins.render-markdown = {
    enable = true;
    settings = {
      file_types = [
        "markdown"
        "codecompanion"
        "AgenticChat"
      ];
      # Enable rendering in normal mode
      render_modes = [
        "n"
        "c"
      ];

      # Configure heading styles
      heading = {
        enabled = true;
        sign = true;
        icons = [
          "󰲡 "
          "󰲣 "
          "󰲥 "
          "󰲧 "
          "󰲩 "
          "󰲫 "
        ];
      };

      # Configure code block rendering
      code = {
        enabled = true;
        sign = true;
        style = "full";
        left_pad = 0;
        right_pad = 0;
      };

      # Configure bullet points
      bullet = {
        enabled = true;
        icons = [
          "●"
          "○"
          "◆"
          "◇"
        ];
      };

      # Configure checkboxes
      checkbox = {
        enabled = true;
        unchecked = {
          icon = "󰄱 ";
        };
        checked = {
          icon = "󰱒 ";
        };
      };

      # Configure quote rendering
      quote = {
        enabled = true;
        icon = "▋";
      };

      # Configure pipe table rendering
      pipe_table = {
        enabled = true;
        style = "full";
      };
    };
  };
}
