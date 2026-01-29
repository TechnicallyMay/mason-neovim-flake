{...}: {
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources = {
        default = ["lsp" "path" "snippets" "buffer"];
        providers.snippets.score_offset = -1;
        providers.path.score_offset = -2;
        providers.buffer.score_offset = -3;
      };
      snippets.preset = "luasnip";
      signature.enabled = true;
    };
  };
}
