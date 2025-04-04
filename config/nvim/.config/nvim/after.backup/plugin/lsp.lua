-- local lsp = require("lsp-zero").preset({})
--
-- lsp.on_attach(function(client, bufnr)
-- 	lsp.default_keymaps({buffer = bufnr})
-- 	local opts = { buffer = bufnr, noremap = true, silent = true }
--
-- 	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- end)
--
--
-- lsp.ensure_installed({
-- 	-- "tsserver",
-- 	"eslint",
-- 	"gopls",
-- 	"lua_ls",
-- 	"html",
-- 	"cssls",
-- 	"jsonls",
-- 	"yamlls",
-- 	"pyright",
-- 	"marksman",
-- 	"clangd",
-- })
--
-- -- (Optional) Configure lua language server for neovim
local lspconfig = require('lspconfig')

-- lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.gopls.setup{
	-- on_attach = require'completion'.on_attach;
	settings = {
		gopls = {
			buildFlags = {"-tags=unit,integration,tools"},
			completeUnimported=true,
		}
	}
}
--
-- local cmp = require("cmp")
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
-- 	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
-- 	["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 	["<C-Space>"] = cmp.mapping.complete(),
-- })
--
--
-- lsp.setup()
-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
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

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('lspconfig').gleam.setup({})
require('lspconfig').rust_analyzer.setup({})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})
