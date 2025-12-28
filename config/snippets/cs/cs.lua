local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

local function get_csharp_namespace()
	local cwd = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")

	local root_files = vim.fs.find(function(name, _)
		return name:match('.*.csproj$') or name:match('.*%.sln$')
	end, { upward = true, path = cwd, type = "file" })

	if #root_files == 0 then
		return "";
	end
	-- Choose an arbitrary found root file, it doesn't matter which
	local root_file = root_files[1]
	-- Get the path above the root file, then strip that from the cwd.
	-- (e.g., /home/user/project/csharp/common/tools => /csharp/common/tools)
	local above_root_dir = vim.fn.fnamemodify(root_file, ":h:h")
	local namespace_path = string.gsub(cwd, above_root_dir, "", 1)

	-- Capitialize the start of the string and any folder name
	local characters_to_uppercase = { "^[a-z]", "/[a-z]" }
	local namespace = namespace_path
	for _, value in ipairs(characters_to_uppercase) do
		namespace = string.gsub(namespace, value, function(s) return string.upper(s) end)
	end

	-- Change slashes to dots, remove any possible leading slash
	namespace = string.gsub(namespace, "^/", "")
	namespace = string.gsub(namespace, "/", ".")

	return namespace
end

local regular_snippets = {
	-- Namespace
	s("ns", fmta("namespace <namespace>;",
	{
		namespace = f(function()
			return get_csharp_namespace()
		end, {})
	})),

	-- Doc comment
	s("///", fmt("/// <summary>\n///\t{finish}\n/// </summary>",
	{
		finish = i(0),
	})),

	-- Var
	postfix(".var", {
		d(1, function(_, parent)
			local splitParts = vim.split(parent.snippet.env.POSTFIX_MATCH, '.', { plain = true });
			local defaultName = splitParts[#splitParts]
			defaultName = string.lower(string.sub(defaultName, 1, 1)) .. string.sub(defaultName, 2)

			return sn(nil, fmt("var {name} = {value}",
			{
				name = i(1, defaultName),
				value = t(parent.snippet.env.POSTFIX_MATCH .. ";")
			}))
		end, {}),
	}),

	-- If
	s("if ", fmta("if (<condition>)\n{\n\t<finish>\n}",
	{
		condition = i(1),
		finish = i(0),
	})),

	-- Class
	s("class", fmta("<visibility> class <name>\n{\n\t<finish>\n}",
	{
		visibility = c(1, { t("public"), t("private"), t("internal") }),
		name = i(2, "NewClass"),
		finish = i(0),
	})),

	-- Partial Class
	s("pclass", fmta("<visibility> partial class <name>\n{\n\t<finish>\n}",
	{
		visibility = c(1, { t("public"), t("private"), t("internal") }),
		name = i(2, "NewClass"),
		finish = i(0),
	})),

	-- Method
	s("meth", fmta("<visibility> <returnType> <name>(<arguments>)\n{\n\t<finish>\n}",
	{
		visibility = c(1, { t("public"), t("private"), t("internal") }),
		returnType = i(2, "void"),
		name = i(3, "NewMethod"),
		arguments = i(4),
		finish = i(0),
	})),

	-- TODO: 'For' postfix
}

local auto_snippets = { };

return regular_snippets, auto_snippets
