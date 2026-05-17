return {
  {
    'mfussenegger/nvim-dap-python',
    dependencies = { 'mfussenegger/nvim-dap' },
    ft = { 'python' },
    config = function()
      require('dap-python').setup 'debugpy-adapter'

      vim.keymap.set('n', '<leader>dn', function()
        require('dap-python').test_method()
      end, { desc = 'Debug: Test Method' })
      vim.keymap.set('n', '<leader>df', function()
        require('dap-python').test_class()
      end, { desc = 'Debug: Test Class' })
    end,
  },
}
