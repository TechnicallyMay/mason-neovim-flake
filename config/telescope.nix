{
    plugins.telescope = {
      enable = true;
      settings = {
        defaults = {
          path_display = [
            "filename_first"
          ];
        };
      };
      keymaps = {
        "<leader>sg" = {
          action = "live_grep";
        };
        "<leader>sF" = {
          action = "git_files";
        };
        "<leader>sb" = {
          action = "buffers";
        };
        "<leader>sf" = {
          action = "find_files";
        };
        "<C-n>" = {
          action = "move_selection_next";
        };
        "<C-p>" = {
          action = "move_selection_previous";
        };
      };
    };
}
