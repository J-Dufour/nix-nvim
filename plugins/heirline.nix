{
  plugins.heirline.enable = true;

  extraConfigLua = ''
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")

    -- Resolve colors from the active colorscheme at runtime
    local function setup_colors()
      local palette = {}
      local function get_hl(name, attr)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
        if ok and hl[attr] then
          return string.format("#%06x", hl[attr])
        end
      end
      palette.bg       = get_hl("Normal",      "bg")  or "#fdf6e3"
      palette.fg       = get_hl("Normal",      "fg")  or "#5c6a72"
      palette.red      = get_hl("DiagnosticError",   "fg") or "#f85552"
      palette.green    = get_hl("DiagnosticOk",      "fg") or "#8da101"
      palette.yellow   = get_hl("DiagnosticWarn",    "fg") or "#dfa000"
      palette.blue     = get_hl("Function",          "fg") or "#3a94c5"
      palette.magenta  = get_hl("Statement",         "fg") or "#df69ba"
      palette.cyan     = get_hl("DiagnosticHint",    "fg") or "#35a77c"
      palette.orange   = get_hl("Constant",          "fg") or "#f57d26"
      palette.gray     = get_hl("Comment",           "fg") or "#a6b0a0"
      palette.surface  = get_hl("StatusLine",        "bg") or "#e9dbb5"
      return palette
    end

    require("heirline").load_colors(setup_colors())

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        utils.on_colorscheme(setup_colors())
      end,
    })

    -- ──────────────────────────────────────────────────────────
    -- Components
    -- ──────────────────────────────────────────────────────────

    local ViMode = {
      init = function(self)
        self.mode = vim.fn.mode(1)
      end,
      static = {
        mode_names = {
          n   = "NORMAL",  no  = "N·OP",   nov = "N·OP",
          noV = "N·OP",    nt  = "NORMAL",
          v   = "VISUAL",  vs  = "VISUAL",
          V   = "V-LINE",  Vs  = "V-LINE",
          s   = "SELECT",  S   = "S-LINE",
          i   = "INSERT",  ic  = "INSERT",  ix = "INSERT",
          R   = "REPLACE", Rc  = "REPLACE", Rv = "V-REPL",
          c   = "COMMAND", cv  = "EX",
          r   = "...",     rm  = "MORE",   ["r?"] = "CONFIRM",
          ["!"] = "SHELL", t   = "TERM",
        },
        mode_hl = {
          n   = { fg = "bg", bg = "blue",    bold = true },
          i   = { fg = "bg", bg = "green",   bold = true },
          v   = { fg = "bg", bg = "magenta", bold = true },
          V   = { fg = "bg", bg = "magenta", bold = true },
          s   = { fg = "bg", bg = "magenta", bold = true },
          S   = { fg = "bg", bg = "magenta", bold = true },
          R   = { fg = "bg", bg = "red",     bold = true },
          c   = { fg = "bg", bg = "orange",  bold = true },
          t   = { fg = "bg", bg = "yellow",  bold = true },
        },
      },
      provider = function(self)
        local name = self.mode_names[self.mode] or self.mode
        return " " .. name .. " "
      end,
      hl = function(self)
        local key = self.mode:sub(1, 1)
        return self.mode_hl[key] or { fg = "bg", bg = "gray", bold = true }
      end,
      update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function() vim.cmd("redrawstatus") end),
      },
    }

    local Git = {
      condition = conditions.is_git_repo,
      init = function(self)
        self.status = vim.b.gitsigns_status_dict or {}
      end,
      {
        provider = function(self)
          local head = self.status.head or ""
          return head ~= "" and ("  " .. head .. " ") or ""
        end,
        hl = { fg = "orange", bold = true },
      },
      {
        provider = function(self)
          local a = self.status.added   or 0
          local r = self.status.removed or 0
          local c = self.status.changed or 0
          local parts = {}
          if a > 0 then table.insert(parts, "+" .. a) end
          if r > 0 then table.insert(parts, "-" .. r) end
          if c > 0 then table.insert(parts, "~" .. c) end
          return #parts > 0 and (table.concat(parts, " ") .. " ") or ""
        end,
        hl = function(self)
          if (self.status.added or 0) > 0 then return { fg = "green" } end
          if (self.status.removed or 0) > 0 then return { fg = "red" } end
          return { fg = "yellow" }
        end,
      },
    }

    local FileNameBlock = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
    }
    local FileName = {
      provider = function(self)
        local fname = vim.fn.fnamemodify(self.filename, ":.")
        if fname == "" then return "[No Name]" end
        if not conditions.width_percent_below(#fname, 0.3) then
          fname = vim.fn.pathshorten(fname)
        end
        return fname
      end,
      hl = { bold = true },
    }
    local FileFlags = {
      {
        condition = function() return vim.bo.modified end,
        provider = " [+]",
        hl = { fg = "green" },
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = " ",
        hl = { fg = "orange" },
      },
    }
    FileNameBlock = utils.insert(FileNameBlock, FileName, FileFlags, { provider = "%<" })

    local Diagnostics = {
      condition = conditions.has_diagnostics,
      update = { "DiagnosticChanged", "BufEnter" },
      init = function(self)
        self.errors   = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints    = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info     = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,
      {
        provider = function(self)
          return self.errors > 0 and (" E:" .. self.errors) or ""
        end,
        hl = { fg = "red" },
      },
      {
        provider = function(self)
          return self.warnings > 0 and (" W:" .. self.warnings) or ""
        end,
        hl = { fg = "yellow" },
      },
      {
        provider = function(self)
          return self.hints > 0 and (" H:" .. self.hints) or ""
        end,
        hl = { fg = "cyan" },
      },
      {
        provider = function(self)
          return self.info > 0 and (" I:" .. self.info) or ""
        end,
        hl = { fg = "blue" },
      },
      { provider = " " },
    }

    local LSPActive = {
      condition = conditions.lsp_attached,
      update = { "LspAttach", "LspDetach" },
      provider = function()
        local names = {}
        for _, srv in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
          table.insert(names, srv.name)
        end
        return #names > 0 and (" [" .. table.concat(names, ", ") .. "] ") or ""
      end,
      hl = { fg = "green", bold = true },
    }

    local FileType = {
      provider = function()
        local ft = vim.bo.filetype
        return ft ~= "" and (" " .. ft .. " ") or ""
      end,
      hl = { fg = "gray" },
    }

    local Ruler = {
      provider = " %l:%c  %P ",
      hl = { fg = "gray" },
    }

    local Align = { provider = "%=" }
    local Space = { provider = " " }

    -- ──────────────────────────────────────────────────────────
    -- Statusline assembly
    -- ──────────────────────────────────────────────────────────

    require("heirline").setup({
      statusline = {
        ViMode,
        Space,
        Git,
        FileNameBlock,
        Align,
        Diagnostics,
        LSPActive,
        FileType,
        Ruler,
      },
    })
  '';
}
