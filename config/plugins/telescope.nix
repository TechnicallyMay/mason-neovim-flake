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
    extensions.ui-select.enable = true;
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
      "<leader>sr" = {
        action = "resume";
      };
      "<leader>sw" = {
        action = "grep_string";
      };
      "<leader>sR" = {
        action = "oldfiles";
      };
      "<leader>sq" = {
        action = "quickfix";
      };
      "<leader>sd" = {
        action = "diagnostics";
      };
      "<leader>s/" = {
        action = "current_buffer_fuzzy_find";
      };
      "<leader>sh" = {
        action = "help_tags";
      };
      "<leader>sk" = {
        action = "keymaps";
      };
      "<leader>gh" = {
        action = "git_bcommits";
      };
      "<leader>s'" = {
        action = "marks";
      };
      "gr" = {
        action = "lsp_references";
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
