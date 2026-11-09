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

    -- Cursor line must be transparent for theme transparency to work
    vim.api.nvim_set_hl(0, 'CursorLine', {})

    -- Visual selection - transparent background with bold/italic text
    vim.api.nvim_set_hl(0, 'Visual', { fg = '#ebdbb2', bold = true, italic = true })

    -- Git hunk inline previews (the word-diff regions, used by both
    -- preview_hunk and preview_hunk_inline). gitsigns links these to
    -- TermCursor, which is reverse video here, so the changed words end up
    -- inverted against the diff line and become unreadable. Use explicit
    -- dark-on-accent colors instead.
    vim.api.nvim_set_hl(0, 'GitSignsAddInline', { fg = '#1d2021', bg = '#a9b665' })
    vim.api.nvim_set_hl(0, 'GitSignsChangeInline', { fg = '#1d2021', bg = '#89b482' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteInline', { fg = '#1d2021', bg = '#ea6962' })

    -- Make telescope transparent
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { bg = 'none' })

    -- Transparent floating windows (diagnostics, hover, signature help, cmp)
    -- Set here (not in init.lua) to ensure they load AFTER the colorscheme
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#928374', bg = 'none' })
    -- Float titles (e.g. goto-preview filename) would otherwise get theme bg5
    vim.api.nvim_set_hl(0, 'FloatTitle', { fg = '#e78a4e', bg = 'none', bold = true })

    -- Completion menu (Pmenu) - transparent with prominent selection
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'PmenuSel', { bg = 'none', fg = '#ebdbb2', bold = true, italic = true })
    vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#504945' })
    vim.api.nvim_set_hl(0, 'MsgArea', { bg = '#282828' })
  end,
}
