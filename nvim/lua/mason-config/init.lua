require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = false
})

local lspconfig = require("lspconfig")
local capabilities = require('blink.cmp').get_lsp_capabilities()
local mason_lspconfig = require("mason-lspconfig")

for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
  lspconfig[server_name].setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      vim.notify("attaching " .. server_name)
    end,
  })
end
