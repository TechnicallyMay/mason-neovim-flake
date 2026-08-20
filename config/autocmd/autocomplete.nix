{
  opts.complete = "o";
  opts.completeopt = "fuzzy,menuone,popup,noinsert";
  opts.autocomplete = false;
  autoCmd = [
    {
      event = "LspAttach";
      callback.__raw = ''
          function(ev)
            vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
              autotrigger = true;
          })
        end
      '';
    }
  ];

  keymaps = [
    {
      key = "<C-Space>";
      action = "<C-n>";
      mode = "i";
      options.desc = "Trigger LSP completion";
      options.silent = true;
    }
  ];
}
