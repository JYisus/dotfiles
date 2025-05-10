return {
	'leoluz/nvim-dap-go',
	dependencies = { -- optional packages
		'mfussenegger/nvim-dap',
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
	},
	config = function()
		local dap_go = require('dap-go')
		local dap = require('dap')
		dap_go.setup()
		-- For One
		table.insert(dap.configurations.go, {
			type = 'delveone',
			name = 'One CONTAINER debugging',
			mode = 'remote',
			request = 'attach',
			substitutePath = {
				-- { from = '/opt/homebrew/Cellar/go/1.23.1/libexec', to = '/usr/local/go'},
				{ from = '${workspaceFolder}', to = '/usr/local/bin/newflex-api' },
			},
		})
	end,
}
