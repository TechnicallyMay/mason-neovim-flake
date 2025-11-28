{
  autoCmd = [
    {
      event = "TextYankPost";
      callback.__raw = ''
        function()
          vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
        end
      '';
    }
  ];
}
