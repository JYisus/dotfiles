vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'RRethy/vim-illuminate'
	use 'mg979/vim-visual-multi'
	use 'wbthomason/packer.nvim'
	use 'windwp/nvim-ts-autotag'
	use 'windwp/nvim-autopairs'
	use 'lewis6991/gitsigns.nvim'
	use 'numToStr/Comment.nvim'
	use "lukas-reineke/lsp-format.nvim"
	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua' -- recommended if need floating window support
	use 'neovim/nvim-lspconfig'
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	use 'jose-elias-alvarez/typescript.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	-- vim.cmd('colorscheme rose-pine-dawn')
	vim.cmd('colorscheme rose-pine-moon')
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use 'theprimeagen/harpoon'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use 'wuelnerdotexe/vim-astro'
	use 'triarius/json2struct.nvim'
	use ({'toppair/peek.nvim',
		run = "deno task --quiet build:fast"

	})
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use ({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	})
	use {'folke/todo-comments.nvim', requires = {{ "nvim-lua/plenary.nvim" }}}
	use 'nvim-pack/nvim-spectre'

end)
