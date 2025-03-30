require("lsp-format").setup {}
require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").eslint.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").lua_ls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").pylsp.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").marksman.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").buf_ls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").clangd.setup {
	on_attach = require("lsp-format").on_attach,
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}
require("lspconfig").html.setup { on_attach = require("lsp-format").on_attach }
