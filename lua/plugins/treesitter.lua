local M = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	opts = {},
}

M.config = function()
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
