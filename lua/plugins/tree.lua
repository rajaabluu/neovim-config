local M = {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<CR>", mode = "n", silent = true, noremap = true },
	},
	config = function()
		require("nvim-tree").setup({
			-- diagnostics = {
			-- 	enable = true,
			-- 	show_on_dirs = true,
			-- 	show_on_open_dirs = true,
			-- 	debounce_delay = 50,
			-- 	severity = {
			-- 		min = vim.diagnostic.severity.HINT,
			-- 		max = vim.diagnostic.severity.ERROR,
			-- 	},
			-- 	icons = {
			-- 		hint = " ",
			-- 		info = "",
			-- 		warning = "",
			-- 		error = "",
			-- 	},
			-- },
			view = {
				signcolumn = "no",
				width = {
					max = 30,
					padding = 3,
				},
			},
			renderer = {
				root_folder_label = ":~:s",
				icons = {
					show = {
						diagnostics = true,
					},
					git_placement = "right_align",
					hidden_placement = "right_align",
					diagnostics_placement = "right_align",
					glyphs = {
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "r",
							untracked = "u",
							deleted = "",
							ignored = "◌",
						},
					},
				},
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
			},
		})
		vim.o.confirm = true
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
			pattern = "NvimTree_*",
			callback = function()
				local layout = vim.api.nvim_call_function("winlayout", {})
				if
					layout[1] == "leaf"
					and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
					and layout[3] == nil
				then
					vim.cmd("confirm quit")
				end
			end,
		})
	end,
}

return M
