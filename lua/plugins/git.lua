local fugitive_commands = {
  "G",
  "Git",
  "Gdiffsplit",
  "Gread",
  "Gwrite",
  "Ggrep",
  "GMove",
  "GDelete",
  "GBrowse",
  "GRemove",
  "GRename",
  "Glgrep",
  "Gedit",
}

return {
  { "tpope/vim-fugitive", cmd = fugitive_commands }, --  Git management, commit, push and more
  { "tpope/vim-rhubarb" },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
      defaults = {}
    }
  },
}
