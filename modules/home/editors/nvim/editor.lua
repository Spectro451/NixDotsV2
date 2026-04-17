return {
	{ "folke/tokyonight.nvim", enabled = false },
	{ "catppuccin/nvim", enabled = false },
	{ "saghen/blink.cmp", enabled = true },
	{ "rafamadriz/friendly-snippets", enabled = true },
	{ "windwp/nvim-ts-autotag", enabled = true, opts = {} },
	{ "folke/todo-comments.nvim", enabled = true },
	{ "folke/persistence.nvim", enabled = true },
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				vue = { "prettierd", "prettier", stop_after_first = true },
				nix = { "alejandra" },
				lua = { "stylua" },
			},
		},
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePre", "FocusLost", "BufLeave" }, {
				group = vim.api.nvim_create_augroup("ConformAutoFormat", { clear = true }),
				callback = function(ev)
					require("conform").format({ bufnr = ev.buf, lsp_format = "fallback" })
					vim.cmd("silent! write")
				end,
			})
		end,
	},
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				sources = {
					explorer = { hidden = true },
				},
			},
			dashboard = {
				preset = {
					header = [[
          ██╗  ██╗██╗██╗    ██╗██╗
          ██║ ██╔╝██║██║    ██║██║
          █████╔╝ ██║██║ █╗ ██║██║
          ██╔═██╗ ██║██║███╗██║██║
          ██║  ██╗██║╚███╔███╔╝██║
          ╚═╝  ╚═╝╚═╝ ╚══╝╚══╝ ╚═╝
                        
          ]],
					keys = {
						{ icon = "󰈞", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
						{ icon = "󰈔", key = "n", desc = "New File", action = ":enew" },
						{ icon = "󰋚", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
						{
							icon = "󰦛",
							key = "s",
							desc = "Restore Session",
							action = ":lua require('persistence').load()",
						},
						{ icon = "󰗼", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ title = "Commands", padding = 1 },
					{ section = "keys", gap = 1, padding = 1 },
					{ title = "Projects", padding = 1 },
					{ section = "projects", gap = 1, padding = 1 },
				},
			},
		},
	},
}
