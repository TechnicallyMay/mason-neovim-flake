{...}: {
  keymaps = [
    {
      key = "<Esc>";
      action.__raw = "vim.cmd.noh";
      "mode" = "n";
      options.desc = "Remove any highlighted matches";
      options.silent = true;
    }

    # Buffers
    ## Navigate
    {
      key = "<C-h>";
      action = "<cmd>wincmd h<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<C-j>";
      action = "<cmd>wincmd j<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<C-k>";
      action = "<cmd>wincmd k<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<C-l>";
      action = "<cmd>wincmd l<CR>";
      mode = "n";
      options.silent = true;
    }

    {
      key = "<leader>bv";
      action = "<cmd>vsplit<CR>";
      mode = "n";
      options.desc = "[B]uffer [V]ertical Split";
      options.silent = true;
    }
    {
      key = "<leader>bs";
      action = "<cmd>split<CR>";
      mode = "n";
      options.desc = "[B]uffer Horizontal [S]plit";
      options.silent = true;
    }
    {
      key = "<leader>bo";
      action = "<C-w>o";
      mode = "n";
      options.desc = "[B]uffer [O]nly";
      options.silent = true;
    }
    {
      key = "<leader>bc";
      action = "<C-w>c";
      mode = "n";
      options.desc = "[B]uffer [C]lose";
      options.silent = true;
    }

    {
      key = "<leader>ww";
      action = "<cmd>set wrap!<CR>";
      mode = "n";
      options.desc = "Toggle [W]ord [W]rap";
      options.silent = true;
    }
  ];
}
