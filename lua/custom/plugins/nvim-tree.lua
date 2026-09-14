return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    { '\\', ':NvimTreeFindFileToggle<CR>', desc = 'Toggle file explorer', silent = true },
  },
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    view = {
      adaptive_size = false,
      centralize_selection = false,
      width = 30,
      side = 'left',
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      icons = {
        show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow = true,
        },
      },
    },
    git = {
      enable = true,
      ignore = false,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = 'H',
        info = 'I',
        warning = 'W',
        error = 'E',
      },
    },
  },
  config = function(_, opts)
    require('nvim-tree').setup(opts)

    local api = require 'nvim-tree.api'

    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        local arg = vim.fn.argv(0)
        local stats = arg ~= '' and vim.uv.fs_stat(arg) or nil
        if stats and stats.type == 'directory' then
          vim.cmd.cd(arg)
        end
        api.tree.open()
      end,
    })

    vim.api.nvim_create_autocmd('QuitPre', {
      callback = function()
        local wins = vim.api.nvim_list_wins()
        local tree_wins = 0
        for _, win in ipairs(wins) do
          if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'NvimTree' then
            tree_wins = tree_wins + 1
          end
        end
        if tree_wins > 0 and tree_wins == #wins then
          vim.cmd 'qall'
        end
      end,
    })
  end,
}