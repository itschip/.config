require("mason-null-ls").setup({

	-- a list of all tools you want to ensure are installed upon
	-- start; they should be the names Mason uses for each tool
	ensure_installed = {

		-- you can pin a tool to a particular version

		"golines",
		"stylua",
		"gofmt",
		"rustfmt",
		"shfmt",
		"dotnet-charpier",
	},

	null_ls_sources = {
		-- Will install the all necessary tools from Mason, in this case `write-good`.
		-- Source must map to the source name in `null-ls`.
		-- Pinning a version or toggling auto_update per tool is not supported.
		"gofmt",
		"golines",
	},

	-- if set to true this will check each tool for updates. If updates
	-- are available the tool will be updated. This setting does not
	-- affect :MasonNullLsUpdate or :MasonNullLsInstall.
	-- Default: false
	auto_update = false,

	-- if set to true, the tool will check null-ls for the available sources,
	-- and then install the dependency(ies) if available in mason.
	-- Default: true
	automatic_installation = true,
})
