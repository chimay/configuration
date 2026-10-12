-- vim: set filetype=lua:

--vim.notify("Loading UI2 config")

vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("vim._core.ui2").enable({
			enable = true,
			msg = {
				targets = "cmd",
				dialog = {
					height = 0.5
				},
				msg = {
					height = 0.5
				},
				pager = {
					height = 0.999
				},
			},
		})
	end,
})
