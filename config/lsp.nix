{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      ts_ls.enable = true;
      lua_ls.enable = true;
      nixd.enable = true;
    };

    keymaps = {
      silent = true;
      lspBuf = {
        gd = {
          action = "definition";
          desc = "Goto Definition";
        };
        gr = {
          action = "references";
          desc = "Goto References";
        };
        gi = {
          action = "implementation";
          desc = "Goto Implementation";
        };
        K = {
          action = "hover";
          desc = "Hover";
        };
        "<leader>ss" = {
          action = "workspace_symbol";
          desc = "Workspace Symbol";
        };
        "<leader>rn" = {
          action = "rename";
          desc = "Rename";
        };
      };
      diagnostic = {
        "<leader>sd" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
        "[d" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
        "]d" = {
          action = "goto_prev";
          desc = "Previous Diagnostic";
        };
      };
    };
  };
}
