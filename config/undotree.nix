{
  plugins.undotree.enable = true;
  keymaps = [
    {
      key = "<leader>U";
      action = ":UndotreeToggle";
      "mode" = "n";
      options.desc = "[U]ndo Tree";
      options.silent = true;
    }
  ];
}
