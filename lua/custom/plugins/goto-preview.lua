return {
  'rmagatti/goto-preview',
  dependencies = { 'rmagatti/logger.nvim' },
  event = 'BufEnter',
  -- setup() must run explicitly, so lazy loads and configures it on buffer entry
  config = true,
  opts = {
    -- gpd/gpt/gpi/gpD/gpr preview LSP results, gP closes all preview windows
    default_mappings = true,
    border = 'rounded',
  },
}
