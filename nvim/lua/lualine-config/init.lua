require("lualine").setup({
	options = {
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
            {
                "filename",
                path = 1,
            },
        },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress" },
	},
})
