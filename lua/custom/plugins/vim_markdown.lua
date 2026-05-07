return {
  'preservim/vim-markdown',
  dependencies = {
    'godlygeek/tabular',
  },
  init = function()
    -- Enable folding but not auto-folding (foldmethod=manual)
    vim.g.vim_markdown_folding_disabled = 0
    vim.g.vim_markdown_folding_style_pythonic = 1
    -- Fold H3 and higher (with pythonic style, level 3 = start folding at H3)
    vim.g.vim_markdown_folding_level = 2

    -- Conceal options
    vim.g.vim_markdown_conceal = 1
    vim.g.vim_markdown_conceal_code_blocks = 0

    -- Table formatting with tabular
    vim.g.vim_markdown_toc_autofit = 1 -- Auto-fit table of contents
  end,
}
