{
  plugins.mini = {
    enable = true;
    modules = {
      ai.enable = true;
      move.enable = true;
      splitjoin.enable = true;
      cursorword.enable = true;
      icons.enable = true;
      statusline = {
        enable = true;
        content.active.__raw = ''
          function()
            local MiniStatusline = require('mini.statusline')

            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })

            return MiniStatusline.combine_groups({
                { hl = mode_hl, strings = { mode } },
                { hl = 'MiniStatuslineDevinfo', strings = { git } },
                { hl = 'MiniStatuslineFilename', strings = { "%t" } },
                '%=', -- End left alignment
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                '%<', -- Mark general truncate point
            })
          end
        '';
      };
      surround = {
        enable = true;
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };
    };
  };
}
