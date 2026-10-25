-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local g = vim.g

g.autoformat = false
g.catppuccin_flavour = "macchiato"
g.dashboard_disable_statusline = 1
g.dashboard_enable_session = 0
g.lazyvim_php_lsp = "intelephense"
g.maplocalleader = ";"

-- Native inline completions don't support being shown as regular completions
g.ai_cmp = false

-- Set to `true` in your `options.lua` to enable experimental support for Next Edit Suggestions
g.copilot_nes = false

opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1
opt.completeopt = { "menu", "menuone", "noselect" }
opt.guifont = "FiraCode Nerd Font:h13"
opt.joinspaces = false
opt.list = true
opt.mouse = ""
opt.pumblend = 10
opt.relativenumber = true
opt.runtimepath:append(vim.fn.getcwd() .. "/.nvim")
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.timeoutlen = 200
opt.wrap = false

opt.fillchars = {
  vert = "▕", -- alternatives │
  fold = " ",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "╱", -- alternatives = ⣿ ░ ─
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

opt.wildignore = {
  "*.aux,*.out,*.toc",
  "*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
  -- media
  "*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
  "*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
  "*.eot,*.otf,*.ttf,*.woff",
  "*.doc,*.pdf",
  -- archives
  "*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
  -- temp/system
  "*.*~,*~ ",
  "*.swp,.lock,.DS_Store,._*,tags.lock",
  -- version control
  ".git,.svn",
}
