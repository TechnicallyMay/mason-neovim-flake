{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "substitute.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "gbprod";
        repo = "substitute.nvim";
        rev = "9db749a";
        hash = "sha256-2z2mwBFzA3wUwcVvyu409JGu2j1+1SVpDhTZ7uzoduM=";
      };
    })
  ];
  extraConfigLua = ''
    require('substitute').setup({
        highlight_substituted_text = {
          enabled = false
        }
    })
  '';
  keymaps = [
    {
      key = "<leader>p";
      action.__raw = "require('substitute').operator";
      "mode" = "n";
      options.desc = "[P]ut";
      options.silent = true;
    }
    {
      key = "<leader>p";
      action.__raw = "require('substitute').visual";
      "mode" = "x";
      options.desc = "[P]ut";
      options.silent = true;
    }
  ];
}
