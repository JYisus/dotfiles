local peek = require("peek")

peek.setup({
	-- theme = 'light'
	app = 'browser'
})

vim.api.nvim_create_user_command("PeekOpen", function ()
	if not peek.is_open() and vim.bo[vim.api.nvim_get_current_buf()].filetype == 'markdown' then
    vim.fn.system('i3-msg split horizontal')
    peek.open()
  end
end, {})
vim.api.nvim_create_user_command("PeekClose",function()
  if peek.is_open() then
    peek.close()
    vim.fn.system('i3-msg move left')
  end
end,  {})

-- vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
-- vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
