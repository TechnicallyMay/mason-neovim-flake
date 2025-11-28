{
  plugins.oil = {
    enable = true;
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
