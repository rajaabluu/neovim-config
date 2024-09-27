local M = {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
}

M.config = function()
	local bufferline = require("bufferline")
	bufferline.setup({
		options = {
			offsets = {
				{
					filetype = "NvimTree",
					text = "Explorer",
					highlight = "Directory",
					text_align = "left",
					separator = true,
				},
			},
			close_command = "Bdelete",
			highlights = {
				buffer_selected = {
					bold = false,
					italic = true,
				},
			},
		},
	})
end

return M
