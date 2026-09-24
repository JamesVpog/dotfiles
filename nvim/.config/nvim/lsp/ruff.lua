---@type vim.lsp.Config  
return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  on_attach = function(client, bufnr)
  -- disable hover in favor of pyright
    client.server_capabilities.hoverProvider = false

-- for python files, use "leader f" for auto format
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format({ async = true })
        end, { buffer = bufnr, desc = 'Format with Ruff' })
  end,
}
