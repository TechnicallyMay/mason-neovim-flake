{
  plugins.roslyn.enable = true;
  plugins.lsp = {
    enable = true;
    inlayHints = true;

    servers = {
      ts_ls.enable = true;
      lua_ls.enable = true;
      nixd.enable = true;
      # csharp_ls.enable = true;
    };

    keymaps = {
      silent = true;
      lspBuf = {
        gd = {
          action = "definition";
          desc = "[G]oTo [D]efinition";
        };
        gt = {
          action = "type_definition";
          desc = "[G]oTo [T]ype Definition";
        };
        gr = {
          action = "references";
          desc = "[G]oTo [R]eferences";
        };
        gi = {
          action = "implementation";
          desc = "[G]oTo [I]mplementation";
        };
        K = {
          action = "hover";
          desc = "Hover";
        };
        "<leader>ss" = {
          action = "document_symbol";
          desc = "Document Symbol";
        };
        "<leader>sS" = {
          action = "workspace_symbol";
          desc = "Workspace Symbol";
        };
        "<leader>rn" = {
          action = "rename";
          desc = "[R]efactor Re[n]ame";
        };
        "<leader>rr" = {
          action = "code_action";
          desc = "[R]efactor show all actions";
        };
      };
      diagnostic = {
        "<leader>ds" = {
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
