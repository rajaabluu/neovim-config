local M = {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
	require("lualine").setup({
		options = {
			globalstatus = true,
		},
	})
end

return M
