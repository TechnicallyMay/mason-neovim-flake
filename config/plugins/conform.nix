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
        cs = [
          "csharpier"
        ];
        go = [
          "gofmt"
        ];

        java = [
          "google-java-format"
        ];

        typescript = [
          "prettier"
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

        gofmt = {
          command = lib.getExe' pkgs.go "gofmt";
        };

        gdformat = {
          command = lib.getBin pkgs.gdtoolkit_4 + "/bin/gdformat";
        };

        csharpier = {
          command = "dotnet-csharpier";
          args = ["--write-stdout"];
        };

        google-java-format = {
          command = lib.getExe pkgs.google-java-format;
        };
      };
      format_on_save = {
        timeout_ms = 1000;
        lsp_fallback = true;
      };
    };
  };
}
