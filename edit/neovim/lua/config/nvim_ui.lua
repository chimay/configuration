-- vim: set filetype=lua:

-- require("vim._core.ui2").enable({
--   enable = true,
-- })

require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = "cmd",
		dialog = {
			height = 0.5,
		},
		msg = {
			height = 0.5,
		},
		pager = {
			height = 0.5,
		},
	},
})

-- local ui2_cmdline = vim.api.nvim_create_augroup("ui2_cmdline", {})

-- vim.api.nvim_create_autocmd("FileType", {
--   group = ui2_cmdline,
--   pattern = "cmd",
--   callback = function(args)
--     local win = vim.api.nvim_get_current_win()
--     vim.api.nvim_win_set_config(win, {
--       relative = "editor",
--       width = math.min(80, vim.o.columns - 10),
--       height = 1,
--       row = math.floor(vim.o.lines * 0.70),
--       col = math.floor((vim.o.columns - math.min(80, vim.o.columns - 10)) / 2),
--       anchor = "NW",
--       border = "rounded",
--     })
--   end,
-- })
