return {
  'sainnhe/gruvbox-material',
  priority = 1000, -- Make sure it's loaded early
  config = function()
    vim.g.gruvbox_material_background = 'hard' -- Options: 'soft', 'medium', 'hard'
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_foreground = 'material' -- Options: 'material', 'mix', 'original',
    vim.cmd [[colorscheme gruvbox-material]]
  end,
}
