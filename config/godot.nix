{ pkgs, ... }:
{
  lsp.servers.gdscript = {
    enable = true;
    package = null;
  };

  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    gdscript
    godot_resource
    gdshader
  ];
}

