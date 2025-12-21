{
  plugins.oil = {
    enable = true;
    settings.keymaps = {
      "<C-h>" = false;
      "<C-j>" = false;
      "<C-k>" = false;
      "<C-l>" = false;
    };
  };

  keymaps = [
    {
      key = "-";
      mode = "n";
      action = ":Oil<CR>";
      options.silent = true;
    }
  ];
}
