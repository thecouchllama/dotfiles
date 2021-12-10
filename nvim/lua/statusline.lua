local cobalt2 = require'lualine.themes.cobalt2'

require("bufferline").setup{
 options = {
   show_close_icon = false,
   diagnostics = "nvim_diagnostic"
 }
}

require('lualine').setup{
  options = {
    theme = cobalt2,
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'branch',
        "b:gitsigns_head",
        icon = " ",
      },
    },
    lualine_c = {
      'filename',
      {
        'diff',
        symbols = { added = "  ", modified = "柳", removed = " " },
        color_added = '#ffc600',
        color_modified = '#ffc600',
        color_removed = '#ff2600',
        color = {},
      },
    },
    lualine_x = {
      {
      'diagnostics',
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      color = {},
    },
    'filetype'
    },
    lualine_y = {'progress'},
  }
}
