{pkgs, ...}: {
  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    gdscript
    godot_resource
    gdshader
  ];

  autoCmd = [
    {
      event = [
        "VimEnter"
        "DirChanged"
      ];
      callback.__raw = ''
        function()
          print("Checking for godot project.")
          local cwd = vim.fn.getcwd()
          if not vim.uv.fs_stat(cwd .. "/project.godot") then
            print("No godot project found.")
            return
          end

          local is_server_running = vim.uv.fs_stat(cwd .. "/.server.pipe")
          if not is_server_running then
            print("Detected a godot project, starting a Neovim server.")
            vim.fn.serverstart(cwd .. "/.server.pipe")
          end
        end
      '';
    }
  ];
}
