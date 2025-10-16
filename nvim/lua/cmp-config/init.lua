local capabilities = require('blink.cmp').get_lsp_capabilities()
local lspconfig = require('lspconfig')

--[[ require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
})
lspconfig["gopls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["csharp_ls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["dockerls"].setup({
	capabilities = capabilities,
})
lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
})
require("lspconfig")["cssls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["clangd"].setup({
	capabilities = capabilities,
})
require("lspconfig")["zls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["pylsp"].setup({
	capabilities = capabilities,
})
 ]]
