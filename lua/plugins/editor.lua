return {
  -- Configure LazyVim to load catppuccin
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin-macchiato" } },
  -- Disable scroll in snacks.nvim
  { "snacks.nvim", opts = { scroll = { enabled = false } } },
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
  { "catppuccin/nvim", desc = "Catppuccin Theme", recommended = true },
  { "norcalli/nvim-colorizer.lua", event = "VeryLazy" }, --  Display hex colors preview
}
