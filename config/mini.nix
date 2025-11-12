{
  plugins.mini = {
    enable = true;
    modules = {
      ai.enable = true;
      move.enable = true;
      splitjoin.enable = true;
      surround = {
        enable = true;
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };
    };
  };
}
