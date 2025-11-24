{
  plugins.friendly-snippets = {
    enable = true;
  };
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources = {
        default = ["lsp" "path" "snippets" "buffer"];
        providers.snippets.score_offset = 10;
        providers.path.score_offset = -1;
        providers.buffer.score_offset = -10;
      };
      signature.enabled = true;
    };
  };
}
