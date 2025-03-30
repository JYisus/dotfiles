return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = function()
			require("mason").setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup{
				ensure_installed = { "lua_ls", "gopls" },
			}
		end
	},
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		config=function()
			local lspconfig = require('lspconfig')
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup {}
				end
			})
			lspconfig.gopls.setup{
				settings = {
					gopls = {
						buildFlags = {"-tags=unit,ingtegration,tools"},
						completeUnimported=true,
					}
				}
			}

			vim.opt.signcolumn = 'yes'

			local lspconfig_defaults = require('lspconfig').util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lspconfig_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			-- This is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					local opts = {buffer = event.buf}

					vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
					vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
					vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
					vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
					vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
					vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
					vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
					vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
					vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
					vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
					vim.api.nvim_set_keymap(
						'n', 'gl', ':lua vim.diagnostic.open_float()<CR>',
						{ noremap = true, silent = true }
					)
			end,
		})
		end,

	},
	-- 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer',
	-- 'hrsh7th/cmp-path',
	-- 'hrsh7th/cmp-cmdline',
	-- 'hrsh7th/nvim-cmp',
	-- config=function()
	-- 	local lspconfig = require('lspconfig')
	-- 	require("mason-lspconfig").setup_handlers({
	-- 		function(server_name)
	-- 			lspconfig[server_name].setup {}
	-- 		end
	-- 	})
	-- 	lspconfig.gopls.setup{
	-- 		settings = {
	-- 			gopls = {
	-- 				buildFlags = {"-tags=unit,ingtegration,tools"},
	-- 				completeUnimported=true,
	-- 			}
	-- 		}
	-- 	}
	--
	-- 	vim.opt.signcolumn = 'yes'
	--
	-- local lspconfig_defaults = require('lspconfig').util.default_config
	-- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	-- 	'force',
	-- 	lspconfig_defaults.capabilities,
	-- 	require('cmp_nvim_lsp').default_capabilities()
	-- )
	--
	-- -- This is where you enable features that only work
	-- -- if there is a language server active in the file
	-- vim.api.nvim_create_autocmd('LspAttach', {
	-- 	desc = 'LSP actions',
	-- 	callback = function(event)
	-- 		local opts = {buffer = event.buf}
	--
	-- 		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	-- 		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	-- 		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	-- 		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	-- 		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	-- 		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	-- 		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	-- 		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	-- 		vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	-- 		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	-- 	vim.api.nvim_set_keymap(
	-- 		'n', 'gl', ':lua vim.diagnostic.open_float()<CR>',
	-- 	{ noremap = true, silent = true }
	-- )
	--
	-- 	end,
	-- })
	--
	-- local cmp = require'cmp'
	--
	-- cmp.setup({
	-- 	snippet = {
	-- 		-- REQUIRED - you must specify a snippet engine
	-- 		expand = function(args)
	-- 			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	-- 			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	-- 			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	-- 			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	-- 		end,
	-- 	},
	-- 	window = {
	-- 		-- completion = cmp.config.window.bordered(),
	-- 		-- documentation = cmp.config.window.bordered(),
	-- 	},
	-- 	mapping = cmp.mapping.preset.insert({
	-- 		['<C-b>'] = cmp.mapping.scroll_docs(-4),
	-- 		['<C-f>'] = cmp.mapping.scroll_docs(4),
	-- 		['<C-Space>'] = cmp.mapping.complete(),
	-- 		['<C-e>'] = cmp.mapping.abort(),
	-- 		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- 	}),
	-- 	sources = cmp.config.sources({
	-- 		{ name = 'nvim_lsp' },
	-- 		{ name = 'vsnip' }, -- For vsnip users.
	-- 		-- { name = 'luasnip' }, -- For luasnip users.
	-- 		-- { name = 'ultisnips' }, -- For ultisnips users.
	-- 		-- { name = 'snippy' }, -- For snippy users.
	-- 	}, {
	-- 		{ name = 'buffer' },
	-- 	})
	-- })
	-- end,
}
