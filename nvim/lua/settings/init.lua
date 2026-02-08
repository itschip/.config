local set = vim.opt

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4
set.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 10
set.fileencoding = "utf-8"
set.termguicolors = true

vim.o.colorcolumn = "100"

set.relativenumber = true
set.number = true
set.cursorline = false

set.autoread = true

set.hidden = false

set.laststatus = 3

set.linespace = 10
set.clipboard = "unnamed"

--vim.opt.cursorline = false

vim.opt.list = false
vim.opt.listchars:append("space:⋅")

--vim.g.copilot_enabled = false

--require("ibl").setup()

-- Configure diagnostics to show colored bar in sign column
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "▌",
            [vim.diagnostic.severity.WARN] = "▌",
            [vim.diagnostic.severity.INFO] = "▌",
            [vim.diagnostic.severity.HINT] = "▌",
        },
        linehl = {},
        numhl = {},
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

vim.api.nvim_set_hl(0, "@function.macro.rust", { link = "Regexp" })
