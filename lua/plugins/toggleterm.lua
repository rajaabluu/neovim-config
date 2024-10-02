local M = { "akinsho/toggleterm.nvim", version = "*", config = true, lazy = false }
M.config = function()
	require("toggleterm").setup({
		shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
		open_mapping = [[<C-\>]],
		direction = "float",
		float_opts = {
			border = "rounded",
		},
		highlights = {
			FloatBorder = {
				guifg = "#82aaff",
			},
		},
		on_open = function()
			vim.cmd([[startinsert!]])
		end,
	})
end

local opts = { noremap = true, silent = true }
M.keys = {
	{ "<esc>", [[<C-\><C-n>]], opts, mode = "t" },
	{ "jk", [[<C-\><C-n>]], opts, mode = "t" },
	{ "<C-h>", [[<C-\><C-n><C-W>h]], opts, mode = "t" },
	{ "<C-j>", [[<C-\><C-n><C-W>j]], opts, mode = "t" },
	{ "<C-k>", [[<C-\><C-n><C-W>k]], opts, mode = "t" },
	{ "<C-l>", [[<C-\><C-n><C-W>l]], opts, mode = "t" },
}
return M
