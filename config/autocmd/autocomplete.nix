{
  opts.complete = "o";
  opts.completeopt = "fuzzy,menuone,popup,noselect";
  opts.autocomplete = false;
  autoCmd = [
    {
      event = "LspAttach";
      callback.__raw = ''
          function(ev)
            vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
              autotrigger = false;
          })
        end
      '';
    }
  ];
}
