{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings.sources = [
    { name = "nvim_lsp"; }
    { name = "path"; }
    { name = "buffer"; }
    ];
    settings.mapping = {
      "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";

      "<C-u>" = "cmp.mapping.scroll_docs(4)";
      "<C-d>" = "cmp.mapping.scroll_docs(-4)";

      "<C-y>" = "cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })";
    };
  };
}
