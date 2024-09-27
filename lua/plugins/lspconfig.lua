local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile", "BufEnter", "BufAdd" },
	dependecies = {
		"williamboman/mason.nvim",
	},
}

M.config = function()
	local lspconfig = require("lspconfig")
	local signs = { Error = "", Warn = "", Hint = "", Info = "" }
	local on_attach = require("utils.lsp").on_attach
	local cmp = require("cmp_nvim_lsp")
	local capabilites = cmp.default_capabilities()
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(h, { text = icon, hl = hl, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = false,
	})
	-- Setup LSP
	lspconfig.tailwindcss.setup({
		on_attach = on_attach,
		capabilites = capabilites,
		cmd = { "tailwindcss-language-server.cmd", "--stdio" },
	})
	lspconfig.ts_ls.setup({
		on_attach = on_attach,
		capabilites = capabilites,
		cmd = { "typescript-language-server.cmd", "--stdio" },
	})
	lspconfig.emmet_ls.setup({
		on_attach = on_attach,
		capabilites = capabilites,
		cmd = { "emmet-language-server.cmd", "--stdio" },
	})
	lspconfig.html.setup({
		on_attach = on_attach,
		capabilites = capabilites,
		cmd = { "vscode-html-language-server.cmd", "--stdio" },
	})
	lspconfig.eslint.setup({
		on_attach = on_attach,
		capabilites = capabilites,
		cmd = { "eslint_d.cmd", "--stdio" },
	})
	lspconfig.gopls.setup({ on_attach = on_attach, capabilites = capabilites, cmd = { "gopls.cmd" } })
	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		capabilites = capabilites,
		cmd = { "lua-language-server.cmd", "--stdio" },
	})
end
return M
