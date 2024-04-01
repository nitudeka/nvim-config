require('d32.init')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ 'rose-pine/neovim', name = 'rose-pine' },
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	{'ThePrimeagen/harpoon'},
	'mbbill/undotree',
	'tpope/vim-fugitive',
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
  {'lewis6991/gitsigns.nvim'},
	{'tpope/vim-commentary'},
	{
					"kdheepak/lazygit.nvim",
					cmd = {
									"LazyGit",
									"LazyGitConfig",
									"LazyGitCurrentFile",
									"LazyGitFilter",
									"LazyGitFilterCurrentFile",
					},
					-- optional for floating window border decoration
					dependencies = {
									"nvim-lua/plenary.nvim",
					},
					-- setting the keybinding for LazyGit with 'keys' is recommended in
					-- order to load the plugin when the command is run for the first time
					keys = {
									{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
					}
	},
})
