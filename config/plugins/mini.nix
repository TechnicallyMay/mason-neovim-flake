{
  plugins.mini = {
    enable = true;
    modules = {
      ai = {
        enable = true;

        custom_textobjects = {
          # Disable "function call" in favor of nvim-treesitter-textobjects
          f = null;
        };
      };

      move.enable = true;
      splitjoin.enable = true;
      cursorword.enable = true;
      icons.enable = true;
      surround = {
        enable = true;
        mappings = {
          add = "ys";
          delete = "ds";
          find = "";
          find_left = "";
          highlight = "";
          replace = "cs";
          update_n_lines = "";
        };
      };
    };
  };
}
