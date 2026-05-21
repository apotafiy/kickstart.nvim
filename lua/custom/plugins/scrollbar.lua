return {
  'petertriho/nvim-scrollbar',
  dependencies = {
    'lewis6991/gitsigns.nvim',
  },
  config = function()
    require('scrollbar').setup {
      -- Performance Tweak
      max_lines = 5000,
      folds = 500,
      throttle_ms = 100,

      show_in_active_only = true,
      hide_if_all_visible = true,

      -- Visual Handle (Gruvbox Material 'Grey')
      handle = {
        text = ' ',
        color = '#7c6f64', -- Soft, warm grey for the moving thumb slider
      },

      -- Background Track (Gruvbox Material 'Bg0' / 'Bg1')
      background = {
        text = ' ',
        color = '#282828', -- Classic Gruvbox Material medium dark background
        blend = 0, -- Keep it solid to match the background cleanly
      },

      -- Marks & HUD Indicators (Gruvbox Material Accent Palette)
      marks = {
        Search = { color = '#e78a4e' }, -- Material Orange
        Error = { color = '#ea6962' }, -- Material Red (much softer than pure red)

        -- Git Integration:
        GitAdd = { color = '#a9b665' }, -- Material Green
        GitChg = { color = '#e78a4e' }, -- Material Orange/Yellow for modifications
      },

      excluded_filetypes = {
        'cmp_docs',
        'cmp_menu',
        'noice',
        'prompt',
        'TelescopePrompt',
        'NvimTree',
        'neo-tree',
        'oil',
      },
      excluded_buftypes = {
        'terminal',
      },

      handlers = {
        gitsigns = true,
        diagnostics = true,
      },
    }
  end,
}
