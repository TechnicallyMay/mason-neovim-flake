{
  plugins.gitsigns = {
    enable = true;
  };

  keymaps = [
    {
      key = "<leader>gd";
      action = ":Gitsigns diffthis master<CR>";
      "mode" = "n";
      options.desc = "[G]it [D]iff";
      options.silent = true;
    }
    {
      key = "<leader>gb";
      action = ":Gitsigns blame<CR>";
      "mode" = "n";
      options.desc = "[G]it [B]lame";
      options.silent = true;
    }
  ];
}
