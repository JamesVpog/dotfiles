vim.lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml' },
  root_markers = { '.git'},
  --
  -- settings = {
  --   yaml = {
  --     schemaStore = {
  --       enable = true,
  --       url = "https://www.schemastore.org/api/json/catalog.json",
  --     },
  --     schemas = {
  --               -- which schemas to use in yaml
  --       ["https://raw.githubusercontent.com/actions/starter-workflows/main/.github/workflows/schema.json"] = "/.github/workflows/*.yml",
  --       kubernetes = "*.k8s.yaml",
  --     },
  --   },
  -- },
})
