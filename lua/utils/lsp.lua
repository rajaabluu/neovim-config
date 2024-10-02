local M = {
	on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		local keymap = vim.keymap
		keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts)
		keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
		keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
		keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	end,
}

return M
