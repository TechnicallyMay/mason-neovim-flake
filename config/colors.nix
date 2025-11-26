{pkgs, ...}: {
  # colorschemes.tokyonight = {
  #   enable = true;
  #   settings.style = "night";
  # };
  # colorschemes.nightfox = {
  #   enable = true;
  #   flavor = "carbonfox";
  # };
  # colorschemes.everforest.enable = true;
  # colorschemes.bamboo.enable = true;
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
  ];

  extraConfigLua = ''
    vim.cmd("colorscheme christmas")
  '';
}
