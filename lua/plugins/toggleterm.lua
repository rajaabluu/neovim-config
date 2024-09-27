local M = { "akinsho/toggleterm.nvim", version = "*", config = true, lazy = false }
M.config = function()
	require("toggleterm").setup({
		shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
		open_mapping = [[<C-\>]],
		direction = "horizontal",
		float_opts = {
			border = "rounded",
		},
		on_open = function(terminal)
			local api = require("nvim-tree.api")
			local nvimtree_view = require("nvim-tree.view")
			if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
				local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
				api.tree.toggle()
				nvimtree_view.View.width = nvimtree_width
				api.tree.toggle(false, true)
				vim.cmd([[startinsert!]])
			end
		end,
	})
end

local opts = { noremap = true, silent = true }
-- Table keys untuk key mapping terminal
M.keys = {
	-- Keymaps untuk terminal mode
	{ "<esc>", [[<C-\><C-n>]], opts, mode = "t" },
	{ "jk", [[<C-\><C-n>]], opts, mode = "t" },
	{ "<C-h>", [[<C-\><C-n><C-W>h]], opts, mode = "t" },
	{ "<C-j>", [[<C-\><C-n><C-W>j]], opts, mode = "t" },
	{ "<C-k>", [[<C-\><C-n><C-W>k]], opts, mode = "t" },
	{ "<C-l>", [[<C-\><C-n><C-W>l]], opts, mode = "t" },
}
return M
