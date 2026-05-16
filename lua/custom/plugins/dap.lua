return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()
      require('nvim-dap-virtual-text').setup()

      vim.keymap.set('n', '<Down>', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<Right>', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<Left>', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<Up>', dap.restart_frame, { desc = 'Debug: Restart Frame' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })

      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })

      dap.listeners.before.attach.dapui_config = dapui.open
      dap.listeners.before.launch.dapui_config = dapui.open
    end,
  },
}
