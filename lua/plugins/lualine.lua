local M = {}
local components = require("plugins.lualine.components")

local sections = {
  -- these are to remove the defaults
  lualine_a = {},

  lualine_b = {},
  lualine_y = {},
  lualine_z = {},
  -- These will be filled later
  lualine_c = {},
  lualine_x = {},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(sections.lualine_x, component)
end

-- Mode
ins_left(components.mode)

-- Git info
ins_left(components.project)
ins_left(components.git)

-- Window number
ins_left(components.win_number)

-- File icon type
ins_left(components.file_type_icon)

-- File read info
ins_left(components.file_name_and_info)

-- Diff
ins_left(components.git_diff)

ins_right(components.readonly_status)

-- Diagnostics
ins_right(components.diagnostics)

-- Treesitter
ins_right(components.treesitter_status)

-- Lsp status
ins_right(components.lsp_status)

--- Position
ins_right(components.file_position)

-- Scroll
ins_right(components.file_scroll)

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = sections,
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    return opts
  end,
}
