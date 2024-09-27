local M = {
	"nvimdev/lspsaga.nvim",
	lazy = false,
}

M.config = function()
	require("lspsaga").setup({
		lightbulb = {
			enable = false,
		},
		symbol_in_winbar = {
			folder_level = 1,
		},
		rename = {
			keys = {
				quit = "<Esc>",
			},
		},
	})
end

return M
