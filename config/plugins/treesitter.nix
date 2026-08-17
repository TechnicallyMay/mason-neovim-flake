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

  plugins.treesitter-textobjects.enable = true;

  keymaps = [
    # Repeat movement with ; and ,
    # f/F/t/T are wrapped so they register with repeatable_move; behavior is identical to native vim
    {
      mode = ["n" "x" "o"];
      key = "f";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').builtin_f_expr";
      options.expr = true;
    }
    {
      mode = ["n" "x" "o"];
      key = "F";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').builtin_F_expr";
      options.expr = true;
    }
    {
      mode = ["n" "x" "o"];
      key = "t";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').builtin_t_expr";
      options.expr = true;
    }
    {
      mode = ["n" "x" "o"];
      key = "T";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').builtin_T_expr";
      options.expr = true;
    }
    {
      mode = ["n" "x" "o"];
      key = ";";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next()
        end
      '';
      options.desc = "Repeat last move next";
    }
    {
      mode = ["n" "x" "o"];
      key = ",";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_previous()
        end
      '';
      options.desc = "Repeat last move previous";
    }

    # Move - goto next start
    {
      mode = ["n" "x" "o"];
      key = "]m";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end
      '';
      options.desc = "Next function start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]c";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
        end
      '';
      options.desc = "Next class start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]o";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@loop.*", "textobjects")
        end
      '';
      options.desc = "Next loop start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]s";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
        end
      '';
      options.desc = "Next scope";
    }
    {
      mode = ["n" "x" "o"];
      key = "]z";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
        end
      '';
      options.desc = "Next fold";
    }

    # Move - goto next end
    {
      mode = ["n" "x" "o"];
      key = "]M";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
        end
      '';
      options.desc = "Next function end";
    }
    {
      mode = ["n" "x" "o"];
      key = "][";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
        end
      '';
      options.desc = "Next class end";
    }

    # Move - goto previous start
    {
      mode = ["n" "x" "o"];
      key = "[m";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end
      '';
      options.desc = "Previous function start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
        end
      '';
      options.desc = "Previous class start";
    }

    # Move - goto previous end
    {
      mode = ["n" "x" "o"];
      key = "[M";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
        end
      '';
      options.desc = "Previous function end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[]";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
        end
      '';
      options.desc = "Previous class end";
    }

    # Select textobjects
    {
      mode = ["x" "o"];
      key = "ab";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects")
        end
      '';
      options.desc = "Select outer block";
    }
    {
      mode = ["x" "o"];
      key = "ib";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects")
        end
      '';
      options.desc = "Select inner block";
    }
    {
      mode = ["x" "o"];
      key = "ac";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects")
        end
      '';
      options.desc = "Select outer call";
    }
    {
      mode = ["x" "o"];
      key = "ic";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects")
        end
      '';
      options.desc = "Select inner call";
    }
    {
      mode = ["x" "o"];
      key = "af";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
        end
      '';
      options.desc = "Select outer function";
    }
    {
      mode = ["x" "o"];
      key = "if";
      action.__raw = ''
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
        end
      '';
      options.desc = "Select inner function";
    }
  ];
}
