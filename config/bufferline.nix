{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        always_show_bufferline = false;
        mode = "tabs";
        themable = true;
        max_name_length = 30;
        max_prefix_length = 30;
        tab_size = 21;
        diagnostics = false;
        color_icons = true;
        show_buffer_icons = true;
        show_buffer_close_icons = false;
        show_close_icon = false;
        indicator.style = "none";
      };

      highlights = {
        buffer_selected = {
          bold = true;
          italic = false;
        };
      };
    };
  };
}
