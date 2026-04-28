{pkgs, ...}: {
  plugins.neotest = {
    enable = true;
    adapters.dotnet = {
      enable = true;
      settings = {
        discovery_root = "solution";
      };
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>tt";
      action = "<cmd>lua require('neotest').run.run()<CR>";
      options = {
        desc = "[T]est - Run nearest [T]est";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>tf";
      action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
      options = {
        desc = "[T]est - Run [F]ile";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>ta";
      action = "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>";
      options = {
        desc = "[T]est - Run [A]ll tests";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>ts";
      action = "<cmd>lua require('neotest').summary.toggle()<CR>";
      options = {
        desc = "[T]est - Toggle [S]ummary";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>to";
      action = "<cmd>lua require('neotest').output.open({ enter = true })<CR>";
      options = {
        desc = "[T]est - Show [O]utput";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>tO";
      action = "<cmd>lua require('neotest').output_panel.toggle()<CR>";
      options = {
        desc = "[T]est - Toggle [O]utput Panel";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>tS";
      action = "<cmd>lua require('neotest').run.stop()<CR>";
      options = {
        desc = "[T]est - [S]top";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>td";
      action = "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>";
      options = {
        desc = "[T]est - [D]ebug nearest test";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "[t";
      action = "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>";
      options = {
        desc = "Jump to previous failed test";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "]t";
      action = "<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>";
      options = {
        desc = "Jump to next failed test";
        noremap = true;
      };
    }
  ];
}
