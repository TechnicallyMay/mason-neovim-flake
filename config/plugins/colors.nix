{pkgs, ...}: {
  colorschemes.vague.enable = true;
  extraPlugins = [
    (
      pkgs.vimUtils.buildVimPlugin {
        name = "no-clown-fiesta";
        src = pkgs.fetchFromGitHub {
          owner = "aktersnurra";
          repo = "no-clown-fiesta.nvim";
          rev = "04b808e9769ded988089772ffcaf08d92d75d927";
          hash = "sha256-lx/DVKRUpNaeBf3TziAWd1lxo3wup/e8zCv+rW+tkmM=";
        };
      }
    )
    (
      pkgs.vimUtils.buildVimPlugin {
        name = "shadow";
        src = pkgs.fetchFromGitHub {
          owner = "rjshkhr";
          repo = "shadow.nvim";
          rev = "4a4b66968a80bd89723c1ce93643e332cd874e13";
          hash = "sha256-DP9hlT3lxE6eXsa0by7TSRMWHZrdfRh64nHl4PjI1Uk=";
        };
      }
    )
    (
      pkgs.vimUtils.buildVimPlugin {
        name = "sonokai";
        src = pkgs.fetchFromGitHub {
          owner = "sainnhe";
          repo = "sonokai";
          rev = "ec07018";
          hash = "sha256-NJsBkz2Rsh+e2bTev2sqlqTzZewzohZvb/yR3/wSmo0=";
        };
      }
    )
  ];

  extraConfigLua = ''
    -- vim.cmd("colorscheme shadow")
    -- vim.cmd("colorscheme no-clown-fiesta")
    -- vim.cmd("colorscheme sonokai")
    -- vim.cmd("colorscheme vscode")
  '';
}
