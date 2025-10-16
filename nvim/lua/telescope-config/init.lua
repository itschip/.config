--[[require("telescope").setup({
	defaults = {
        --prompt_prefix = '',
        --entry_prefix = ' ',
        --selection_caret = ' ',
        preview = false,
        selection_strategy = "reset",
        sorting_strategy = "descending",
        --layout_strategy = 'grey',
        scroll_strategy = "cycle",
        winblend = 0,
        color_devicons = true,
		layout_config = {
            width = 0.95,
            height = 0.85,
              -- preview_cutoff = 120,
            prompt_position = "top",
            horizontal = {
                width = 0.8,
                height = 0.4,
                preview_width = function(_, cols, _)
                  if cols > 200 then
                    return math.floor(cols * 0.4)
                  else
                    return math.floor(cols * 0.6)
                  end
                end,
            },

            vertical = {
                width = 0.3,
                height = 0.4,
                preview_height = 0.5,
            },

            flex = {
                horizontal = {
                  preview_width = 0.0,
                },
            },
        }
	},
})--]]


require('telescope').setup({
  defaults = {
    -- These three settings are optional, but recommended.
    --prompt_prefix = '',
    --entry_prefix = ' ',
    preview = false,
    selection_caret = '> ',

    -- This is the important part: without this, Telescope windows will look a
    -- bit odd due to how borders are highlighted.
    --layout_strategy = 'grey',
    layout_config = {
     -- The extension supports both "top" and "bottom" for the prompt.
      prompt_position = 'top',

      -- You can adjust these settings to your liking.
      width = 0.8,
      height = 0.5,
      preview_width = 0.6,
    },
  }
})

-- Force TelescopeSelection highlight to be visible
local function set_telescope_highlights()
  vim.api.nvim_set_hl(0, 'TelescopeSelection', { 
    bg = '#3c4048',  -- Dark gray background for selected item
    fg = '#ffffff',  -- White text for selected item
    bold = true,
    default = false  -- Force override any existing highlights
  })
end

-- Set it immediately
set_telescope_highlights()

-- Set it after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_telescope_highlights,
})

-- Set it after VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
  callback = set_telescope_highlights,
})


--require('telescope').load_extension('grey')
