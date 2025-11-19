{
  plugins.undotree.enable = true;
  keymaps = [
    {
      key = "<leader>U";
      action = "<Cmd>UndotreeToggle<CR>";
      "mode" = "n";
      options.desc = "[U]ndo Tree";
      options.silent = true;
    }
  ];
}
