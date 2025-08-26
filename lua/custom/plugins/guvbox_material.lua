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

    -- Optional: remove terminal transparency (can make text look lighter if your terminal bg is very dark)
    vim.g.gruvbox_material_transparent_background = 0

    -- Apply the colorscheme
    vim.opt.termguicolors = true
    vim.opt.background = 'dark'
    vim.cmd.colorscheme 'gruvbox-material'

    -- Example: override Normal to make it even brighter
    vim.api.nvim_set_hl(0, 'Normal', { fg = '#fbdbb2', bg = '#1d2021' })

    -- Add this line to enhance visual mode highlighting
    vim.api.nvim_set_hl(0, 'Visual', { bg = '#504945', fg = '#ebdbb2', bold = true })

    -- Selected tab (the active tab)
    vim.api.nvim_set_hl(0, 'TabLineSel', { fg = '#ebdbb2', bg = '#a9b665', bold = true })

    -- Unselected tabs
    vim.api.nvim_set_hl(0, 'TabLine', { fg = '#c4b793', bg = '#3c3836' })
  end,
}
