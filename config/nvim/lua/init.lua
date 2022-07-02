
require('nvim-tree').setup {
  git = {
    enable = false,
    ignore = false
  }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark-nvim',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { {
      'filename' ,
      file_status = true , -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', file_status = true, path = 1}},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp" ,
    tab_size = 12,
    offsets = {{
      filetype = "NvimTree",
      text = "File Explorer" ,
      highlight = "Directory",
      text_align = "left"
    }
    }
  }
}

require('gitsigns').setup{
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
}

require("trouble").setup {}

-- local onedarkpro = require("onedarkpro")
-- onedarkpro.setup({
--   hlgroups = {
--   },
--   filetype_hlgroups = {
--     purescript = {
--       purescriptModule = { fg = "${blue}" },
--       purescriptImport = { fg = "${blue}" },
--       purescriptImportAs = { fg = "${blue}" },
--       purescriptConstructor = { fg = "${red}" },
--       purescriptTypeVar = { fg = "${orange}" },
--       -- purescriptType = { fg = "${orange}" },
--       purescriptDelimiter = { fg = "${cyan}" },
--       MatchParen = { fg = "${blue}", bg = "${gray}" },
--     },
--     options = {
--       -- cursorline = false, -- Use cursorline highlighting?
--     }

--   }
-- })
-- onedarkpro.load()
--
require("onedark").setup({
   comment_style = "italic",
  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      MatchParen = { fg = c.cyan0, bg = c.bg_visual, style = "bold "}
    }
  end
})

require('spectre').setup({
  live_update = true, -- auto excute search again when you write any file in vim
  mapping={
    ['send_to_qf'] = {
        map = "<leader>sq",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all item to quickfix"
    },
    ['replace_cmd'] = {
        map = "<leader>sc",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "input replace vim command"
    },
    ['show_option_menu'] = {
        map = "<leader>so",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = "show option"
    },
    ['run_replace'] = {
        map = "<leader>sr",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all"
    },
    ['change_view_mode'] = {
        map = "<leader>sm",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        desc = "change result view mode"
    },
    -- you can put your mapping here it only use normal mode
  },
})

require('fzf-lua').setup{
  winopts = {
    fullscreen = true,
    preview = {
      vertical = 'up:60%',      -- up|down:size
      flip_columns   = 100,             -- #cols to switch to horizontal on flex
      horizontal     = 'right:50%',     -- right|left:size
      hidden         = 'hidden',      -- hidden|nohidden
      layout = "vertical"
    },
  },
  fzf_opts = {
    ['--layout'] = "default",
  },
  files = {
    rg_opts = "--color=never --files --hidden --follow --no-ignore -g '!.git'",
  }
}


require("neogit").setup {
  integrations = {
    diffview = true
  }
}
