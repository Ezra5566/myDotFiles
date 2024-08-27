-- lua/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")

    -- Color table for highlights
    local colors = {
      bg = "#66000000",
      fg = "#bbc2cf",
      yellow = "#ECBE7B",
      cyan = "#008080",
      darkblue = "#081633",
      green = "#98be65",
      orange = "#FF8800",
      violet = "#a9a1e1",
      magenta = "#c678dd",
      blue = "#82AAFF",
      red = "#ec5f67",
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end
    lualine.setup({
      options = {
        globalstatus = true,
        disabled_filetypes = { "alpha", "dashboard", "neo-tree" },
      },
    })
    ins_left({
      function()
        return "▊"
      end,
      color = { fg = colors.blue },
      padding = { left = 0, right = 1 },
    })
    ins_left({
      function()
        local mode_icons = {
          n = "󰰗", -- Normal mode icon
          i = "󰅂", -- Insert mode icon
          v = "󰃤", -- Visual mode icon
          [""] = "󰃤", -- Visual block mode icon
          V = "󰃤", -- Visual line mode icon
          c = "󰈹", -- Command mode icon
          no = "󰰗", -- Normal mode icon (operator-pending)
          s = "󰅛", -- Select mode icon
          S = "󰅛", -- Select line mode icon
          [""] = "󰅛", -- Select block mode icon
          ic = "󰅂", -- Insert mode icon (completion)
          R = "󰂛", -- Replace mode icon
          Rv = "󰂛", -- Replace visual mode icon
          cv = "󰰗", -- Command-line mode (visual)
          ce = "󰰗", -- Command-line mode (operator-pending)
          r = "󰂛", -- Replace mode (prompt)
          rm = "󰂛", -- Replace mode (more)
          ["r?"] = "󰂛", -- Replace mode (prompt question)
          ["!"] = "󰰗", -- Shell command mode icon
          t = "󰰗", -- Terminal mode icon
        }
        return mode_icons[vim.fn.mode()] or "󰰗" -- Default icon
      end,
      color = function()
        local mode_color = {
          n = colors.red, -- Normal mode color
          i = colors.green, -- Insert mode color
          v = colors.blue, -- Visual mode color
          [""] = colors.blue, -- Visual block mode color
          V = colors.blue, -- Visual line mode color
          c = colors.magenta, -- Command mode color
          no = colors.red, -- Normal mode color (operator-pending)
          s = colors.orange, -- Select mode color
          S = colors.orange, -- Select line mode color
          [""] = colors.orange, -- Select block mode color
          ic = colors.yellow, -- Insert mode color (completion)
          R = colors.violet, -- Replace mode color
          Rv = colors.violet, -- Replace visual mode color
          cv = colors.red, -- Command-line mode color (visual)
          ce = colors.red, -- Command-line mode color (operator-pending)
          r = colors.cyan, -- Replace mode color (prompt)
          rm = colors.cyan, -- Replace mode color (more)
          ["r?"] = colors.cyan, -- Replace mode color (prompt question)
          ["!"] = colors.red, -- Shell command mode color
          t = colors.red, -- Terminal mode color
        }
        local mode = vim.fn.mode()
        if mode == "n" or mode == "i" or mode == "v" or mode == "" or mode == "V" then
          return { fg = mode_color[mode] }
        else
          return { fg = colors.default } -- Default color for other modes
        end
      end,
      padding = { right = 1 },
    })

    ins_left({
      "filesize",
      cond = conditions.buffer_not_empty,
    })

    ins_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.magenta, gui = "bold" },
    })

    ins_left({ "location" })

    ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
    })

    ins_left({
      function()
        return "%="
      end,
    })

    ins_left({
      function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = " LSP:",
      color = { fg = "#ffffff", gui = "bold" },
    })

    ins_right({
      "o:encoding",
      fmt = string.upper,
      cond = conditions.hide_in_width,
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({
      "fileformat",
      fmt = string.upper,
      icons_enabled = false,
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({
      "branch",
      icon = "",
      color = { fg = colors.violet, gui = "bold" },
    })

    ins_right({
      "diff",
      symbols = { added = " ", modified = "󰝤 ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    ins_right({
      function()
        return "▊"
      end,
      color = { fg = colors.blue },
      padding = { left = 1 },
    })

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
