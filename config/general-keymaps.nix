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

    ## Resize
    {
      key = "<Left>";
      action = "<cmd>vertical resize +6<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<Right>";
      action = "<cmd>vertical resize -6<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<Up>";
      action = "<cmd>resize -6<CR>";
      mode = "n";
      options.silent = true;
    }
    {
      key = "<Down>";
      action = "<cmd>resize +6<CR>";
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

    # Tabs
    {
      key = "<leader>tn";
      action = "<cmd>tabnew<CR>";
      mode = "n";
      options.desc = "[T]ab [N]ew";
      options.silent = true;
    }
    {
      key = "<leader>tN";
      action = "<cmd>tabnew %<CR>";
      mode = "n";
      options.desc = "[T]ab [N]ew (with current file)";
      options.silent = true;
    }
    {
      key = "<leader>tc";
      action = "<cmd>tabclose<CR>";
      mode = "n";
      options.desc = "[T]ab [C]lose";
      options.silent = true;
    }
    {
      key = "<leader>to";
      action = "<cmd>tabonly<CR>";
      mode = "n";
      options.desc = "[T]ab [O]nly";
      options.silent = true;
    }
    {
      key = "[t";
      action = "<cmd>tabprevious<CR>";
      mode = "n";
      options.desc = "[T]ab [P]revious";
      options.silent = true;
    }
    {
      key = "]t";
      action = "<cmd>tabnext<CR>";
      mode = "n";
      options.desc = "[T]ab [N]ext";
      options.silent = true;
    }
  ];
}
