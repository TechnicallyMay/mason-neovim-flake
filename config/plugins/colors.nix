{pkgs, ...}: {
  # colorschemes.tokyonight = {
  #   enable = true;
  #   settings.style = "night";
  # };
  # colorschemes.nightfox = {
  #   enable = true;
  #   flavor = "carbonfox";
  #
  # };
  # colorschemes.kanagawa-paper = {
  #   enable = true;
  # };
  # colorschemes.everforest.enable = true;
  # colorschemes.bamboo.enable = true;
  # colorschemes.gruvbox.enable = true;
  colorschemes.vscode.enable = true;
  colorschemes.rose-pine.enable = true;
  # colorschemes.nord.enable = true;
  extraPlugins = [
    (
      pkgs.vimUtils.buildVimPlugin {
        name = "christmas.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "ChaseRensberger";
          repo = "christmas.nvim";
          rev = "3618d70";
          hash = "sha256-jKv0IHai9JOsfD74AZefC5TpMsf2cfNOz0OOpRbSALw=";
        };
      }
    )
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
    (
      pkgs.vimUtils.buildVimPlugin {
        name = "monokai-pro";
        src = pkgs.fetchFromGitHub {
          owner = "loctvl842";
          repo = "monokai-pro.nvim";
          rev = "1ac671f";
          hash = "sha256-ZyBmU7FSEVXJGPjPKSJCMo3BJU++yv8r1G0K0t/cPEI=";
        };
      }
    )
  ];

  extraConfigLua = ''
    vim.cmd("colorscheme no-clown-fiesta")
    -- vim.cmd("colorscheme sonokai")
    -- vim.cmd("colorscheme christmas")
    -- vim.cmd("colorscheme vscode")
  '';
}
