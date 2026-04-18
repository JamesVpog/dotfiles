vim.o.number=true
vim.o.clipboard="unnamedplus"
vim.o.termguicolors=true
vim.o.winborder="rounded"


local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
	gh("alexghergh/nvim-tmux-navigation"),
	gh("nvim-mini/mini.nvim"),

	-- programming stuff
	gh("nvim-treesitter/nvim-treesitter"),
	gh("neovim/nvim-lspconfig"),

	-- aesthetics 
	gh("nvim-tree/nvim-web-devicons"),
	gh("catppuccin/nvim"),
})
require('mini.basics').setup()
require('mini.surround').setup()
require('mini.completion').setup()
require('mini.pick').setup()
require('mini.notify').setup()

-- Common Keymaps
vim.keymap.set('n', '<leader><leader>',  '<cmd>Pick files<cr>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>g',  '<cmd>Pick grep_live<cr>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>b',  '<cmd>Pick buffers<cr>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>h',  '<cmd>Pick help<cr>', { desc = 'Help Tags' })


vim.cmd.colorscheme('catppuccin-mocha')

-- rust
vim.pack.add ({
	{src = 'https://github.com/mrcjkb/rustaceanvim', version = vim.version.range('^9') }
})

-- copied sua's tmux for now..
require('nvim-tmux-navigation').setup {
  disable_when_zoomed = true, -- defaults to false
  keybindings = {
    left = '<C-h>',
    down = '<C-j>',
    up = '<C-k>',
    right = '<C-l>',
    last_active = '<C-\\>',
    next = '<C-Space>',
  },
}
