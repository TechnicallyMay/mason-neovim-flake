{pkgs, ...}: {
  plugins.web-devicons.enable = true;
  plugins.treesitter = {
    enable = true;
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

    move = {
      enable = true;
      setJumps = true;
      gotoNextStart = {
        "]]" = "@function.outer";
        "]c" = "@class.outer";
      };

      gotoPreviousStart = {
        "[[" = "@function.outer";
        "[c" = "@class.outer";
      };
      # gotoNextEnd = {
      #   "]M" = "@function.outer";
      #   "][" = "@class.outer";
      # };
      # gotoPreviousEnd = {
      #   "[m" = "@function.outer";
      #   "[]" = "@class.outer";
      # };
    };
  };
}
