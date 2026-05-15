{pkgs, ...}: {
  opts.foldmethod = "expr";
  opts.foldexpr = "v:lua.vim.treesitter.foldexpr()";
  # Don't have folds turned on when starting nvim
  opts.foldenable = false;
  plugins.web-devicons.enable = true;

  plugins.treesitter = {
    enable = true;
    folding.enable = true;
    settings = {
      highlight.enable = true;
    };

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      angular
      bash
      c_sharp
      css
      comment
      go
      html
      java
      json
      lua
      make
      markdown
      markdown_inline
      nix
      regex
      sql
      toml
      typescript
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
      lsp_interop.enable = true;
      move = {
        enable = true;
        set_jumps = false;

        gotoNextStart = {
          "]m" = "@function.outer";
          "]c" = {
            query = "@class.outer";
            desc = "next class start";
          };

          # you can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
          "]o" = "@loop.*";
          # "]o" = { query = { "@loop.inner", "@loop.outer" } ;

          # You can pass a query group to use query from `queries/<lang>/<queryGroup>.scm file in your runtime path.
          # Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          "]s" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "Next scope";
          };
          "]z" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "Next fold";
          };
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[m" = "@function.outer";
          "[]" = "@class.outer";
        };
      };

      select = {
        enable = true;
        keymaps = {
          "ab" = "@block.outer";
          "ib" = "@block.inner";

          "ac" = "@call.outer";
          "ic" = "@call.inner";

          "af" = "@function.outer";
          "if" = "@function.inner";
        };
      };
    };
  };
}
