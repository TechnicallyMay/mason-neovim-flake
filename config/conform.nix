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
        ];
        gdscript = [
          "gdformat"
        ];
        csharp = [
          "csharpier"
        ];
        "_" = [
          "squeeze_blanks"
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

        csharp = {
          command = lib.getExe pkgs.dotnet-sdk + " run csharpier";
        };
      };
      format_on_save = {
        timeout_ms = 1000;
        lsp_fallback = true;
      };
    };
  };
}
