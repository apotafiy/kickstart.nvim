-- Continue markdown todo checkboxes on Enter, preserving indentation (spaces only, no extra indent)
return {
  dir = '.',
  ft = 'markdown',
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function(args)
        vim.keymap.set('i', '<CR>', function()
          local line = vim.api.nvim_get_current_line()
          local indent = line:match '^(%s*)- %[.%]'
          if indent then
            -- Normalize tabs to spaces
            indent = indent:gsub('\t', '    ')
            local keys = vim.api.nvim_replace_termcodes('<CR><C-u>', true, false, true)
            vim.api.nvim_feedkeys(keys, 'n', false)
            vim.schedule(function()
              -- Force the line to exact indent, no auto-indent
              local new_line = indent .. '- [ ] '
              vim.api.nvim_set_current_line(new_line)
              local row = vim.api.nvim_win_get_cursor(0)[1]
              vim.api.nvim_win_set_cursor(0, { row, #new_line })
            end)
          else
            local keys = vim.api.nvim_replace_termcodes('<CR>', true, false, true)
            vim.api.nvim_feedkeys(keys, 'n', false)
          end
        end, { buffer = args.buf })
      end,
    })
  end,
}
