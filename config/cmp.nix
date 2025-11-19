{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources.default = ["lsp" "path" "snippets" "buffer"];
      signature.enabled = true;
    };
  };
}
