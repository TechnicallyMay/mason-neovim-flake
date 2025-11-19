{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        disabled_filetypes = [
          "oil"
        ];
        always_show_tabline = false;
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = {
          left = "";
          right = "";
        };
      };

      sections = {
        lualine_a = [
          "tabs"
        ];
        lualine_b = [
          "branch"
        ];
        lualine_c = [
          "filename"
        ];

        lualine_x.__raw = "{}";
        lualine_y.__raw = "{}";
        lualine_z.__raw = "{}";
      };

      inactive_sections = {
        lualine_a.__raw = "{}";
        lualine_b.__raw = "{}";
        lualine_c.__raw = "{}";
        lualine_x.__raw = "{}";
        lualine_y.__raw = "{}";
        lualine_z = [
          "filename"
        ];
      };
    };
  };
}
