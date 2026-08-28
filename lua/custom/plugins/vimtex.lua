-- VimTeX: LaTeX editing in Neovim
-- Uses latexmk (continuous mode) for compilation and Zathura for viewing.
-- Save a .tex file while `\ll` is running to trigger auto-recompile and
-- have Zathura reload the PDF automatically.
return {
  {
    'lervag/vimtex',
    lazy = false, -- VimTeX must load eagerly; do not lazy-load it
    ft = { 'tex', 'latex', 'bib' },
    init = function()
      -- Viewer: Zathura (with SyncTeX support; auto-reloads on recompile)
      vim.g.vimtex_view_method = 'zathura'

      -- Compiler: latexmk in continuous mode (default for VimTeX)
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = '',
        out_dir = '',
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        hooks = {},
        options = {
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }

      -- Quickfix: only open on errors, not warnings
      vim.g.vimtex_quickfix_open_on_warning = 0

      -- Disable the default insert-mode mappings (they can conflict/surprise)
      vim.g.vimtex_imaps_enabled = 0

      -- Don't fold by default
      vim.g.vimtex_fold_enabled = 0
    end,
  },
}
