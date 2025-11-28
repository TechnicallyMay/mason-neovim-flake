{
  plugins.luasnip = {
    enable = true;
    fromLua = [{paths = ../snippets;}];
    settings = {
      enable_autosnippets = true;
      region_check_events = ["CursorMoved"];
      ext_opts.__raw = let
        types = "require('luasnip.util.types')";
      in ''
        {
        	[${types}.choiceNode] = {
        		active = {
        			virt_text = {{"", "@comment.todo"}}
        		}
        	},
        	[${types}.insertNode] = {
        		active = {
        			virt_text = {{"", "@comment"}}
        		}
        	}
        }

      '';
    };
    luaConfig.post = ''
      local ls = require("luasnip")

      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-n>", function()
      	if ls.choice_active() then
      		ls.change_choice(1)
      	end
      end, {silent = true})
    '';
  };
}
