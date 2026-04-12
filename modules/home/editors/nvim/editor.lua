return {
  { "folke/tokyonight.nvim",        enabled = false },
  { "catppuccin/nvim",              enabled = false },
  { "saghen/blink.cmp",             enabled = true },
  { "rafamadriz/friendly-snippets", enabled = true },
  { "windwp/nvim-ts-autotag",       enabled = true },
  { "folke/todo-comments.nvim",     enabled = true },
  { "folke/persistence.nvim",       enabled = true },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript      = { "prettierd", "prettier", stop_after_first = true },
        typescript      = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        nix             = { "nixfmt" },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
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
    },
  },
}
