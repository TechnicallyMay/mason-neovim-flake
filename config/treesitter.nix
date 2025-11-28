{pkgs, ...}: {
  opts.foldmethod = "expr";
  opts.foldexpr = "v:lua.vim.treesitter.foldexpr()";
  # Don't have folds turned on when starting nvim
  opts.foldenable = false;
  plugins.web-devicons.enable = true;
  plugins.treesitter = {
    enable = true;
    folding = true;
    settings = {
      highlight.enable = true;
    };

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      c_sharp
      comment
      json
      lua
      make
      markdown
      nix
      regex
      toml
      vim
      vimdoc
      xml
      yaml
    ];
  };

  plugins.treesitter.settings.incremental_selection = {
    enable = true;
    keymaps = {
      node_incremental = "<CR>";
      node_decremental = "<S-CR>";
    };
  };

  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      move = {
        enable = true;
        set_jumps = true;
        goto_next_start = {
          "]]" = "@function.outer";
          "]c" = "@class.outer";
        };
        goto_previous_start = {
          "[[" = "@function.outer";
          "[c" = "@class.outer";
        };
      };

      select = {
        enable = true;
        keymaps = {
          ab = "@block.outer";
          ib = "@block.inner";

          ac = "@call.outer";
          ic = "@call.inner";

          af = "@function.outer";
          "if" = "@function.inner";
        };
      };
    };
  };
}
