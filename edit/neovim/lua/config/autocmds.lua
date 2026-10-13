-- vim: set filetype=lua:

-- credit : https://github.com/radleylewis/nvim-lite

-- disable line numbers in terminal {{{1

local augroup = vim.api.nvim_create_augroup("UserConfig", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("TermOpen", {
  group = augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

-- auto-close terminal when process exits {{{1

autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

-- statusline disappear when on :ex cmdline {{{1

---- see <url:~/racine/config/edit/neovim/autocommand.vim>

-- vim.api.nvim_create_autocmd({ 'CmdlineEnter', 'CmdlineLeave' }, {
--   callback = function(ev)
--     vim.o.laststatus = ev.event == 'CmdlineEnter' and 0 or 3
--   end,
-- })
