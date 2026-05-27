return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    local nvim_tmux_nav = require 'nvim-tmux-navigation'

    nvim_tmux_nav.setup {
      disable_when_zoomed = true,
    }

    -- Mirror tmux convention: <C-b> (tmux prefix) then arrow keys to move
    -- between panes/splits. Works seamlessly across nvim splits and tmux panes.
    vim.keymap.set('n', '<C-b><Left>', nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = 'Tmux/Nvim navigate left' })
    vim.keymap.set('n', '<C-b><Down>', nvim_tmux_nav.NvimTmuxNavigateDown, { desc = 'Tmux/Nvim navigate down' })
    vim.keymap.set('n', '<C-b><Up>', nvim_tmux_nav.NvimTmuxNavigateUp, { desc = 'Tmux/Nvim navigate up' })
    vim.keymap.set('n', '<C-b><Right>', nvim_tmux_nav.NvimTmuxNavigateRight, { desc = 'Tmux/Nvim navigate right' })
  end,
}
