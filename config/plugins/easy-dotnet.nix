{
  pkgs,
  lib,
  ...
}: let
  buildDotnetGlobalTool = pkgs.dotnetCorePackages.buildDotnetGlobalTool;
  easy-dotnet = buildDotnetGlobalTool {
    pname = "EasyDotnet";
    executables = ["dotnet-easydotnet"];
    version = "2.3.63";
    nugetHash = "sha256-8ywDdEWxDZUtggvY/2d4Revk09+qb3llymru0Ptpp5c=";

    meta = {
      description = "Easy Dotnet Server is the lightweight C# JSON-RPC server powering the easy-dotnet.nvim Neovim plugin";
      homepage = "https://github.com/GustavEikaas/easy-dotnet-server";
      license = lib.licenses.mit;
      platforms = lib.platforms.linux;
    };
  };

  allSdks = with pkgs.dotnetCorePackages; combinePackages [sdk_8_0 sdk_9_0 sdk_10_0];
in {
  extraPackages = with pkgs; [netcoredbg allSdks dotnet-ef easy-dotnet roslyn-ls];

  plugins.easy-dotnet.enable = true;

  extraConfigLua = ''
    local dotnet = require("easy-dotnet")
    dotnet.setup({
      test_runner = {
        viewmode = "split"
        icons = {
          passed = "",
          skipped = "",
          failed = "",
          success = "",
          reload = "",
          test = "",
          sln = "󰘐",
          project = "󰘐",
          dir = "",
          package = "",
        },
        mappings = {
          run_all = { lhs = "<leader>tR", desc = "[T]est [R]un All" },
          run = { lhs = "<leader>tr", desc = "[T]est [R]un" },

          debug_test = { lhs = "<leader>td", desc = "[T]est [D]ebug" },

          run_test_from_buffer = { lhs = "<leader>td", desc = "[T]est [D]ebug" },
          run_all_tests_from_buffer = { lhs = "<leader>tD", desc = "[T]est [D]ebug All" },

          peek_stack_trace_from_buffer = { lhs = "<leader>p", desc = "peek stack trace from buffer" },
          filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
          go_to_file = { lhs = "g", desc = "go to file" },
          peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
          expand = { lhs = "o", desc = "expand" },
          expand_node = { lhs = "E", desc = "expand node" },
          expand_all = { lhs = "-", desc = "expand all" },
          collapse_all = { lhs = "W", desc = "collapse all" },
          close = { lhs = "q", desc = "close testrunner" },
          refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" }
        }
      },
    });
  '';
}
