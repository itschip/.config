--local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint"),
        require("none-ls.code_actions.eslint"),
        require("null-ls").builtins.formatting.gofumpt,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.csharpier,
        --require("null-ls").builtins.formatting.biome,
    },
    on_attach = function(client, bufnr)
        --[[if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({
                        filter = function(client)
                            return client.name == "null-ls"
                        end,
                        bufnr = bufnr,
                    })
                end,
            }) 
        end--]]
    end,
})
