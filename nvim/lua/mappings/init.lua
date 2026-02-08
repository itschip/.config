local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local Terminal = require("toggleterm.terminal").Terminal

local terminals = {}

vim.g.mapleader = " "


-- Standard stuff
map("n", "<leader>fn", "<cmd>enew<cr>", opts)
map("n", "<leader>c", "<cmd>bdelete<cr>", opts)

-- Navigate
map("n", "<leader>e", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
map("n", "<leader>a", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
map("n", "<S-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
map("n", "<S-j>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
map("n", "<S-k>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
map("n", "<S-l>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)

map("n", "<leader>o", "<cmd>Explore<CR>", opts)
-- map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", opts)

map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fg", ":Telescope git_files<CR>", opts)
-- Find directory and open Neo-tree there
vim.keymap.set("n", "<leader>fd", function()
    require("telescope.builtin").find_files({
        find_command = { "fd", "--type", "d", "--exclude", ".git" },
        prompt_title = "Find Directory",
        attach_mappings = function(_, map_fn)
            map_fn("i", "<CR>", function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                require("telescope.actions").close(prompt_bufnr)
                vim.cmd("Explore " .. selection.value)
            end)
            map_fn("n", "<CR>", function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                require("telescope.actions").close(prompt_bufnr)
                vim.cmd("Explore " .. selection.value)
            end)
            return true
        end,
    })
end, opts)
map("i", "jk", "<C-\\><C-n>", opts)
map("i", "jj", "<C-\\><C-n>", opts)

-- Terminal
map("n", "<C-\\>", "<cmd>ToggleTerm size=60 direction=vertical<cr>", opts)
map("n", "<leader>th", "<cmd>ToggleTerm size=25 direction=horizontal<cr>", opts)
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", opts)

map("t", "<esc>", "<C-\\><C-n>", opts)

-- LSP Mappings
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
map("n", "gc", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
map("n", "gq", "<cmd>lua vim.diagnostic.setqflist()<cr>", opts)


-- Smart Splits
map("n", "<C-h>", "<cmd>lua require('smart-splits').move_cursor_left()<cr>", opts)
map("n", "<C-j>", "<cmd>lua require('smart-splits').move_cursor_down()<cr>", opts)
map("n", "<C-k>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>", opts)
map("n", "<C-l>", "<cmd>lua require('smart-splits').move_cursor_right()<cr>", opts)

map("n", "<leader><leader>k", "<cmd>SmartResizeUp<cr>", opts)
map("n", "<leader><leader>j", "<cmd>SmartResizeDown<cr>", opts)
map("n", "<leader><leader>h", "<cmd>SmartResizeLeft<cr>", opts)
map("n", "<leader><leader>l", "<cmd>SmartResizeRight<cr>", opts)


map("n", "<leader>h", ":split<CR>", opts)
map("n", "<leader>v", ":vsplit<CR>", opts)

-- Nvim tree

