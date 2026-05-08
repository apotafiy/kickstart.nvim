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

        -- Leader+c for creating/toggling todos
        vim.keymap.set('n', '<leader>c', function()
          local line = vim.api.nvim_get_current_line()
          -- Check if line starts with a todo checkbox (with optional indentation)
          local indent, checkbox = line:match '^(%s*)(- %[.%])'

          if checkbox then
            -- Toggle between "- [ ]" and "- [x]"
            local new_checkbox
            if checkbox == '- [ ]' then
              new_checkbox = '- [x]'
            elseif checkbox == '- [x]' then
              new_checkbox = '- [ ]'
            else
              -- For any other checkbox state (like "- [~]"), default to "- [ ]"
              new_checkbox = '- [ ]'
            end

            -- Keep rest of the line content after checkbox
            local rest_of_line = line:match '%- %[.%](.*)$'
            if rest_of_line == nil then
              rest_of_line = ''
            end

            local new_line = indent .. new_checkbox .. rest_of_line
            vim.api.nvim_set_current_line(new_line)

            -- Move cursor to end of checkbox
            local cursor_row = vim.api.nvim_win_get_cursor(0)[1]
            local cursor_col = #(indent .. new_checkbox)
            vim.api.nvim_win_set_cursor(0, { cursor_row, cursor_col })
          else
            -- No checkbox found, prepend with "- [ ]"
            local trim_line = line:gsub('^%s*', '')
            local indent_match = line:match '^(%s*)'
            local indent_str = indent_match or ''
            local new_line = indent_str .. '- [ ] ' .. trim_line
            vim.api.nvim_set_current_line(new_line)

            -- Move cursor to end of checkbox
            local cursor_row = vim.api.nvim_win_get_cursor(0)[1]
            local cursor_col = #(indent_str .. '- [ ] ')
            vim.api.nvim_win_set_cursor(0, { cursor_row, cursor_col })
          end
        end, { buffer = args.buf })
      end,
    })
  end,
}
