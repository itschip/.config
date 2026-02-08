require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

-- Disable automatic setup so we can handle it manually with full control
mason_lspconfig.setup({
    automatic_enable = false,
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
    local opts = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            vim.notify("attaching " .. server_name)
        end,
    }

    -- Attempt to load mason-lspconfig specific configuration for the server
    -- This is crucial for servers like 'astro' which need special 'before_init' logic
    local ok, mason_config = pcall(require, "mason-lspconfig.lsp." .. server_name)
    if ok then
        opts = vim.tbl_deep_extend("force", mason_config, opts)
    end

    -- Use vim.lsp.config instead of deprecated lspconfig[server].setup()
    vim.lsp.config(server_name, opts)
    vim.lsp.enable(server_name)
end
