{
  lib,
  pkgs,
  ...
}: {
  plugins.dap = {
    enable = true;
    adapters = {
      executables = {
        coreclr = {
          command = lib.getExe pkgs.netcoredbg;
          args = ["--interpreter=vscode"];
        };

        netcoredbg = {
          command = lib.getExe pkgs.netcoredbg;
          args = ["--interpreter=vscode"];
        };
      };
    };
  };

  plugins.dap-ui.enable = true;

  extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  '';

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>dc";
      action = "<cmd>lua require('dap').continue()<CR>";
      options = {
        desc = "[D]AP - [C]ontinue";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<Right>";
      action = "<cmd>lua require('dap').step_into()<CR>";
      options = {
        desc = "DAP - Step Into (right for entering the method)";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<Down>";
      action = "<cmd>lua require('dap').step_over()<CR>";
      options = {
        desc = "DAP - Step Over (down for next line)";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<Left>";
      action = "<cmd>lua require('dap').step_out()<CR>";
      options = {
        desc = "DAP - Step Out (left for exiting the method)";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<Up>";
      action = "<cmd>lua require('dap').step_back()<CR>";
      options = {
        desc = "[D]AP - Step Back (Up for previous line)";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>dr";
      action = "<cmd>lua require('dap').restart()<CR>";
      options = {
        desc = "[D]AP - [R]estart";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>dd";
      action = "<cmd>lua require('dap').continue()<CR>";
      options = {
        desc = "[D]AP - Start/Continue";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>dD";
      action = "<cmd>lua require('dap').terminate()<CR>";
      options = {
        desc = "[D]AP - Terminate";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>db";
      action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
      options = {
        desc = "[D]AP - Toggle [B]reakpoint";
        noremap = true;
      };
    }
    {
      mode = ["n"];
      key = "<leader>dh";
      action = "<cmd>lua require('dap').run_to_cursor()<CR>";
      options = {
        desc = "[D]AP - run to cursor ([H]ere)";
        noremap = true;
      };
    }
  ];
}
