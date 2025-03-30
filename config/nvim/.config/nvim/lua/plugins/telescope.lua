return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			-- require("telescope.pickers").new({}, {
			-- 	prompt_title = "Harpoon",
			-- 	finder = require("telescope.finders").new_table({
			-- 		results = file_paths,
			-- 	}),
			-- 	previewer = conf.file_previewer({}),
			-- 	sorter = conf.generic_sorter({}),
			-- }):find()
		end
	end
}
