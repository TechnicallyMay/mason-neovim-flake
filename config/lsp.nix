{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      ts_ls.enable = true;
      lua_ls.enable = true;
      nixd.enable = true;
    };
  };
}
