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
    prompt_prefix = '',
    entry_prefix = ' ',
    selection_caret = ' ',
    preview = false,

    layout_strategy = 'grey',
    layout_config = {
      prompt_position = 'top',
      width = 0.8,
      height = 0.5,
    },
  }
})



require('telescope').load_extension('grey')
