{
  lib,
  pkgs,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = [
          "alejandra"
          "squeeze_blanks"
        ];
        gd = [
          "gdformat"
        ];
        "_" = [
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters = {
        alejandra = {
          command = lib.getExe pkgs.alejandra;
        };

        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };

        gdformat = {
          command = lib.getBin pkgs.gdtoolkit_4 + "/bin/gdformat";
        };
      };
      format_on_save =
        # Lua
        ''
          function(bufnr)
            local function on_format(err)
              if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 200, lsp_fallback = true }, on_format
           end
        '';
    };
  };
}
