{ pkgs, ... }:
{
  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    gdscript
    godot_resource
    gdshader
  ];
}

