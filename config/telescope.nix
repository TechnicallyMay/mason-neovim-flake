{
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>sg" = {
          action = "live_grep";
        };
        "<leader>sF" = {
          action = "git_files";
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
