return {
	'lewis6991/gitsigns.nvim',
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs                        = {
			add          = { text = '┃' },
			change       = { text = '┃' },
			delete       = { text = '_' },
			topdelete    = { text = '‾' },
			changedelete = { text = '~' },
			untracked    = { text = '┆' },
		},
		signs_staged                 = {
			add          = { text = '┃' },
			change       = { text = '┃' },
			delete       = { text = '_' },
			topdelete    = { text = '‾' },
			changedelete = { text = '~' },
			untracked    = { text = '┆' },
		},
		signs_staged_enable          = true,
		signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl                       = true, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir                 = {
			follow_files = true
		},
		auto_attach                  = true,
		attach_to_untracked          = false,
		current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts      = {
			virt_text = true,
			virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
		sign_priority                = 6,
		update_debounce              = 100,
		status_formatter             = nil, -- Use default
		max_file_length              = 40000, -- Disable if file is longer than this (in lines)
		preview_config               = {
			-- Options passed to nvim_open_win
			border = 'single',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1
		},
	},
	keys = function ()
  	local gs = require("gitsigns")
		return {
			{ "]c", function() if vim.wo.diff then return "]c" end vim.schedule(gs.next_hunk) return "<Ignore>" end, mode = { "n" }, expr = true, desc = "Next hunk" },
			{ "[c", function() if vim.wo.diff then return "[c" end vim.schedule(gs.prev_hunk) return "<Ignore>" end, mode = { "n" }, expr = true, desc = "Prev hunk" },

			-- Actions
			{ "<leader>hs", gs.stage_hunk, desc = "Stage hunk" },
			{ "<leader>hr", gs.reset_hunk, desc = "Reset hunk" },
			{ "<leader>hS", gs.stage_buffer, desc = "Stage buffer" },
			{ "<leader>hu", gs.undo_stage_hunk, desc = "Undo stage hunk" },
			{ "<leader>hR", gs.reset_buffer, desc = "Reset buffer" },
			{ "<leader>hp", gs.preview_hunk, desc = "Preview hunk" },
			{ "<leader>hb", function() gs.blame_line({ full = true }) end, desc = "Blame line" },
			{ "<leader>hd", gs.diffthis, desc = "Diff this" },
			{ "<leader>hD", function() gs.diffthis("~") end, desc = "Diff against last commit" },

			-- Toggles
			{ "<leader>tb", gs.toggle_current_line_blame, desc = "Toggle line blame" },
			{ "<leader>td", gs.toggle_deleted, desc = "Toggle deleted lines" },
		}
	end
}
