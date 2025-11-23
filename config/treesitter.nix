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
}
