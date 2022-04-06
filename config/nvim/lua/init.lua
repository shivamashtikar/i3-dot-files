
require('nvim-tree').setup {
  git = {
    ignore = false
  }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
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
