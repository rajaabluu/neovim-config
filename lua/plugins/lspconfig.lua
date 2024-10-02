local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile", "BufEnter", "BufAdd" },
	dependecies = {
		"williamboman/mason.nvim",
	},
}
M.config = function()
	local lspconfig = require("lspconfig")
	local signs = { Error = "", Warn = "", Hint = " ", Info = "" }
	local on_attach = require("utils.lsp").on_attach
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, hl = hl, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = false,
	})

	-- Setup LSP
	lspconfig.tailwindcss.setup({
		capabilities = capabilities,
		cmd = { "tailwindcss-language-server.cmd", "--stdio" },
		root_dir = lspconfig.util.root_pattern(
			"tailwind.config.js",
			"tailwind.config.cjs",
			"tailwind.config.mjs",
			"tailwind.config.ts",
			"postcss.config.js",
			"postcss.config.cjs",
			"postcss.config.mjs",
			"postcss.config.ts"
		),
	})
	lspconfig.ts_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "typescript-language-server.cmd", "--stdio" },
	})
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		cmd = { "emmet-language-server.cmd", "--stdio" },
		filetypes = {
			"blade",
			"html",
			"css",
			"typescriptreact",
			"javascriptreact",
		},
	})
	lspconfig.html.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "vscode-html-language-server.cmd", "--stdio" },
	})
	lspconfig.intelephense.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "intelephense.cmd", "--stdio" },
	})
	lspconfig.eslint.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "eslint_d.cmd", "--stdio" },
	})
	lspconfig.gopls.setup({ on_attach = on_attach, capabilities = capabilities, cmd = { "gopls.cmd" } })
	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "lua-language-server.cmd", "--stdio" },
	})
end
return M
