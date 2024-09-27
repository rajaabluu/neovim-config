local M = {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufWritePre", "BufNewFile" },
}

M.config = function()
	require("conform").setup({
		formatters_by_ft = {
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			go = { "gofumpt" },
			lua = { "stylua" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
end

return M
