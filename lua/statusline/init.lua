-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/nvim-lua/lsp-status.nvim
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+

-- no need for devicons, just use a patched nerdfont...

require("lualine").setup{
  options = {
      icons_enabled = true,
      theme = "codedark",
      section_separators = { left = '╣', right = '╠' },
      component_separators = { left = '║', right = '║' },
      -- section_separators = '', component_separators = '',
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename', 'require("lsp-status").status()'},
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
