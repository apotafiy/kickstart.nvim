return {
  'sainnhe/gruvbox-material',
  priority = 1000, -- Make sure it's loaded early
  config = function()
    vim.g.gruvbox_material_background = 'hard' -- Options: 'soft', 'medium', 'hard'
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_foreground = 'material' -- Options: 'material', 'mix', 'original',
    vim.g.gruvbox_material_transparent_background = 2 -- 0=disabled, 1=half transparent, 2=full transparent

    -- Apply the colorscheme
    vim.cmd.colorscheme 'gruvbox-material'

    -- Essential overrides for full transparency
    -- Cursor line must be transparent for theme transparency to work
    vim.api.nvim_set_hl(0, 'CursorLine', {})

    -- Visual selection needs transparent background with visible text
    vim.api.nvim_set_hl(0, 'Visual', { fg = '#ebdbb2', bold = true, italic = true })
  end,
}
