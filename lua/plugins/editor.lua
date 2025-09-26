return {
  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
  -- Disable scroll in snacks.nvim
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
  -- Disable completion preselect
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = { preselect = false, auto_insert = false }
        }
      }
    }
  },
  -- catppuccin theme
  {
    desc = "Catppuccin Theme",
    recommended = true,
    "catppuccin/nvim"
  },
  -- missing config
  {
    "ray-x/lsp_signature.nvim",
  },
  -- tailwindcss support
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  }
}
