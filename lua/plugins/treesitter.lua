local M = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	opts = {},
}

M.config = function()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.blade = {
		install_info = {
			url = "https://github.com/EmranMR/tree-sitter-blade",
			files = { "src/parser.c" },
			branch = "main",
		},
		filetype = "blade",
	}
	require("nvim-treesitter.configs").setup({
		indent = {
			enable = true,
		},
		ensure_installed = {
			"json",
			"html",
			"css",
			"yaml",
			"bash",
			"go",
			"typescript",
			"lua",
			"javascript",
		},
		highlight = {
			enable = true,
		},
	})
end

return M
