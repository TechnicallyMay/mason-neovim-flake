{ ... }:
{
  keymaps = [
    {
      key = "<Esc>";
      action.__raw = "vim.cmd.noh";
      "mode" = "n";
      options.desc = "Remove any highlighted matches";
      options.silent = true;
    }
  ];
}
