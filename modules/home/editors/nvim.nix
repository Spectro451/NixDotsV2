{ pkgs, lazyvim, ... }:
{
  imports = [ lazyvim.homeManagerModules.default ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.lazyvim = {
    enable = true;
    plugins = {
colorscheme = ''
  return {
    {
      "LazyVim/LazyVim",
      opts = { colorscheme = function()
        local ok, matugen = pcall(require, "matugen")
        if ok then matugen.setup() end
      end },
    },
    {
      "RRethy/base16-nvim",
      lazy = false,
      priority = 1000,
    },
  }
'';
    editor = ''
      return {
        { "folke/tokyonight.nvim", enabled = false },
        { "catppuccin/nvim", enabled = false },
        { "saghen/blink.cmp", enabled = true },
        { "rafamadriz/friendly-snippets", enabled = true },
        { "stevearc/conform.nvim", enabled = true },
        { "windwp/nvim-ts-autotag", enabled = true },
        { "folke/todo-comments.nvim", enabled = true },
        { "folke/persistence.nvim", enabled = true },
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
    '';
    };
  };
}
