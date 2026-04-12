return {
  'sainnhe/gruvbox-material',
  priority = 1000, -- load early so it takes effect before other plugins
  config = function()
    -- Background darkness level: "soft" = lightest, "medium" = default, "hard" = darkest
    vim.g.gruvbox_material_background = 'soft'

    -- Font style
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold = 1

    -- Foreground (text) brightness:
    -- "material" = bright & clean
    -- "mix" = in between
    -- "original" = muted, classic Gruvbox
    vim.g.gruvbox_material_foreground = 'material'

    -- Enable transparent background so terminal wallpaper shows through
    vim.g.gruvbox_material_transparent_background = 2

    -- Apply the colorscheme
    vim.opt.termguicolors = true
    vim.opt.background = 'dark'
    vim.cmd.colorscheme 'gruvbox-material'

    -- Clear bg on all groups for full transparency
    local groups = {
      'Normal', 'NormalNC', 'NormalFloat', 'SignColumn', 'EndOfBuffer',
      'LineNr', 'CursorLineNr', 'Folded', 'FoldColumn',
      'NonText', 'SpecialKey', 'VertSplit', 'WinSeparator',
      'StatusLine', 'StatusLineNC', 'TabLineFill',
      'DiagnosticSignError', 'DiagnosticSignWarn', 'DiagnosticSignInfo', 'DiagnosticSignHint',
      'GitSignsAdd', 'GitSignsChange', 'GitSignsDelete',
      'CursorLine', 'ColorColumn',
    }
    for _, group in ipairs(groups) do
      local hl = vim.api.nvim_get_hl(0, { name = group })
      hl.bg = nil
      hl.ctermbg = nil
      vim.api.nvim_set_hl(0, group, hl)
    end

    -- Add this line to enhance visual mode highlighting
    vim.api.nvim_set_hl(0, 'Visual', { bg = '#504945', fg = '#ebdbb2', bold = true })

    -- Selected tab (the active tab)
    vim.api.nvim_set_hl(0, 'TabLineSel', { fg = '#ebdbb2', bg = '#a9b665', bold = true })

    -- Unselected tabs
    vim.api.nvim_set_hl(0, 'TabLine', { fg = '#c4b793', bg = '#3c3836' })
  end,
}
