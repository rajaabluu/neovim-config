local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	lazy = false,
}

M.config = function()
	local function match_at_cursor(pattern)
		local col = vim.api.nvim_win_get_cursor(0)[2]
		local text = vim.api.nvim_get_current_line():sub(col, col - 1 + pattern:len())
		return text == pattern
	end
	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = function()
				for _ = 1, 5 do
					cmp.select_prev_item()
				end
			end,
			["<C-f>"] = function()
				for _ = 1, 5 do
					cmp.select_next_item()
				end
			end,
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<CR>"] = cmp.mapping(function(fallback)
				if not cmp.confirm({ select = true }) then
					fallback()
					if match_at_cursor("></") then
						local keys = vim.api.nvim_replace_termcodes("<c-o>O", true, true, true)
						vim.api.nvim_feedkeys(keys, "n", false)
					end
				end
			end),
			-- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
		}, {
			{ name = "buffer" },
		}),
	})
	-- Cmdline Completion
	-- cmp.setup.cmdline(":", {
	-- 	mapping = cmp.mapping.preset.cmdline(),
	-- 	sources = cmp.config.sources({
	-- 		{ name = "path" },
	-- 	}, {
	-- 		{ name = "cmdline" },
	-- 	}),
	-- 	matching = { disallow_symbol_nonprefix_matching = false },
	-- })
end

return M
