vim.o.number=true
vim.o.clipboard="unnamedplus"
vim.o.termguicolors=true
vim.o.winborder="rounded"

-- everything to do with tabs
vim.o.shiftwidth=4
vim.o.smarttab=true
vim.o.expandtab=true
vim.o.tabstop=4

local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    gh("alexghergh/nvim-tmux-navigation"),
    gh("nvim-mini/mini.nvim"),

    -- programming stuff
    gh("neovim/nvim-lspconfig"),
    gh("nvim-treesitter/nvim-treesitter"),

    -- aesthetics 
    gh("nvim-tree/nvim-web-devicons"),
    gh("nvim-lualine/lualine.nvim"),
    gh("catppuccin/nvim"),
    gh("folke/tokyonight.nvim"),
})
require('mini.pairs').setup()
require('mini.snippets').setup()
require('mini.basics').setup({
  options = { basic = true },   -- keeps autoindent etc
  mappings = { basic = false }, -- but don't let it override CR
})
require('mini.surround').setup()
require('mini.completion').setup()
require('mini.pick').setup()
require('mini.notify').setup()

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'winenter',
        'bufenter',
        'bufwritepost',
        'sessionloadpost',
        'filechangedshellpost',
        'vimresized',
        'filetype',
        'cursormoved',
        'cursormovedi',
        'modechanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
-- common keymaps
vim.keymap.set('n', '<leader><leader>',  '<cmd>Pick files<cr>', { desc = 'find files' })
vim.keymap.set('n', '<leader>g',  '<cmd>Pick grep_live<cr>', { desc = 'live grep' })
vim.keymap.set('n', '<leader>b',  '<cmd>Pick buffers<cr>', { desc = 'buffers' })
vim.keymap.set('n', '<leader>h',  '<cmd>Pick help<cr>', { desc = 'help tags' })

-- jump to my config directory in netrw
vim.keymap.set('n', '<leader>en', function()
  vim.cmd('e ' .. vim.fn.stdpath('config') )
end, { desc = 'Edit NVIMconfig' })

vim.cmd.colorscheme('catppuccin-mocha')

-- Python (ruff -> linter, formatter | pyright -> autocomplete/docs)
vim.lsp.enable({ "ruff", "pyright" })

-- rust
vim.pack.add ({
	{src = 'https://github.com/mrcjkb/rustaceanvim', version = vim.version.range('^9') }
})

-- resolve neovim runtimes
vim.lsp.config("lua_ls", {
  settings = {
    lua = {
      runtime = { version = "luajit" },  -- neovim uses luajit
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),  -- loads all neovim runtime files
        checkthirdparty = false,  -- prevents annoying prompts
      },
    },
  },
})

-- lua
vim.lsp.enable("lua_ls")

-- markdowns
vim.lsp.enable("yamlls")


vim.lsp.config('taplo', {
  cmd = { 'taplo', 'lsp', 'stdio' },
  filetypes = { 'toml' },
  root_markers = { '.git' },
})
vim.lsp.enable('taplo')

-- copied sua's tmux for now..
require('nvim-tmux-navigation').setup {
  disable_when_zoomed = true, -- defaults to false
  keybindings = {
    left = '<c-h>',
    down = '<c-j>',
    up = '<c-k>',
    right = '<c-l>',
    last_active = '<c-\\>',
    next = '<c-space>',
  },
}


local autocmd = vim.api.nvim_create_autocmd
autocmd("filetype", { -- enable treesitter highlighting and indents
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)
    if vim.treesitter.language.add(lang) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start()
    end
  end
})

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
})
vim.lsp.enable("gopls")

-- ocaml
vim.lsp.config('ocamllsp', {
  cmd = { 'ocamllsp' },
  filetypes = { 'ocaml', 'mli' },
  root_markers = { '*.opam', '.git', 'dune-project' },
})

vim.lsp.enable("ocamllsp")

