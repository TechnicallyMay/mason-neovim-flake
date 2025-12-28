{...}: {
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources = {
        default = ["lsp" "path" "snippets" "buffer"];
        providers.snippets.score_offset = 10;
        providers.path.score_offset = -1;
        providers.buffer.score_offset = -10;
      };
      snippets.preset = "luasnip";
      signature.enabled = true;
      view.docs.auto_open = true;
    };
  };
}
