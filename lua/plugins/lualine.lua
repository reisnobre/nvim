local conditions = require("plugins.lualine.conditions")
local components = require("plugins.lualine.components")
local theme = require("utils.theme")
local colors = theme.colors.catppuccin[theme.catppuccin_theme]
local mode_color = require("utils.theme").mode_color
local _time = os.date("*t")

local sections = {
  -- these are to remove the defaults
  lualine_a = {},

  lualine_b = {},
  lualine_y = {},
  lualine_z = {},
  -- These will be filled later
  lualine_c = {},
  lualine_x = {
    components.git_diff,
    components.readonly_status,
    components.diagnostics,
    components.treesitter_status,
    components.lsp_status,
    components.file_position,
    components.file_scroll,
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(sections.lualine_c, component)
end

-- Mode
ins_left(components.mode)

-- Git info
ins_left(components.project)
-- ins_left(components.git)

-- Window number
ins_left(components.win_number)

-- File icon type
ins_left(components.file_type_icon)

-- File read info
ins_left(components.file_name_and_info)

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
        globalstatus = vim.o.laststatus == 3,
        icons_enabled = true,
        -- Disable sections and component separators
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
        disabled_filetypes = {
          "dashboard",
          "NvimTree",
          "Outline",
          "alpha",
          "vista",
          "vista_kind",
          "TelescopePrompt",
          "terminal",
          "ministarter",
          "snacks_dashboard",
        },
        always_divide_middle = true,
      },
      sections = sections,
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_v = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {
          {
            function()
              local selector = math.floor(_time.hour / 8) + 1
              local icns = {
                "  ",
                "  ",
                "  ",
              }
              return icns[selector]
            end,
            color = function()
              return { bg = mode_color[vim.fn.mode()], fg = colors.bg_alt }
            end,
            padding = { left = 0, right = 0 },
          },
          {
            "filename",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.blue, gui = "bold" },
          },
        },
        lualine_x = {},
      },
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
