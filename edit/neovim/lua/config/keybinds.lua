-- vim: set filetype=lua:

local map = vim.keymap.set

-- map("x", "<M-:>", function()
--   local lines = vim.fn.getregion(
--     vim.fn.getpos("v"),
--     vim.fn.getpos("."),
--     { type = vim.fn.mode() }
--   )
--   for _, line in ipairs(lines) do
--     vim.cmd.execute(line)
--   end
-- end)

-- example
--map("n", "<f3>", "<cmd>echo 'coucou'<cr>", { desc = "displays coucou" })
