return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.animate').setup()
        require('mini.comment').setup()
        require('mini.move').setup(
            {
                mappings = {
                    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.  
                    left = 'H',
                    right = 'L',
                    down = 'J',
                    up = 'K',

                    -- Move current line in Normal mode
                    line_left = 'H',
                    line_right = 'L',
                    line_down = 'J',
                    line_up = 'K',
                },

                -- Options which control moving behavior
                options = {
                    -- Automatically reindent selection during linewise vertical move
                    reindent_linewise = true,
                },
            }
        )
		require('mini.surround').setup(
			-- No need to copy this inside `setup()`. Will be used automatically.
			{
			  -- Add custom surroundings to be used on top of builtin ones. For more
			  -- information with examples, see `:h MiniSurround.config`.
			  custom_surroundings = nil,

			  -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			  highlight_duration = 500,

			  -- Module mappings. Use `''` (empty string) to disable one.
			  mappings = {
				add = 'sa', -- Add surrounding in Normal and Visual modes
				delete = 'sd', -- Delete surrounding
				find = 'sf', -- Find surrounding (to the right)
				find_left = 'sF', -- Find surrounding (to the left)
				highlight = 'sh', -- Highlight surrounding
				replace = 'sr', -- Replace surrounding
				update_n_lines = 'sn', -- Update `n_lines`

				suffix_last = 'l', -- Suffix to search with "prev" method
				suffix_next = 'n', -- Suffix to search with "next" method
			  },

			  -- Number of lines within which surrounding is searched
			  n_lines = 20,

			  -- Whether to respect selection type:
			  -- - Place surroundings on separate lines in linewise mode.
			  -- - Place surroundings on each line in blockwise mode.
			  respect_selection_type = false,

			  -- How to search for surrounding (first inside current line, then inside
			  -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			  -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			  -- see `:h MiniSurround.config`.
			  search_method = 'cover',

			  -- Whether to disable showing non-error feedback
			  silent = false,
			}
		)
    end,
}

