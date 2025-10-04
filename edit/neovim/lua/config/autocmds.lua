-- vim: set filetype=lua:

-- credit : https://github.com/radleylewis/nvim-lite

-- Basic autocommands

local augroup = vim.api.nvim_create_augroup("UserConfig", {})
local autocmd = vim.api.nvim_create_autocmd

-- Disable line numbers in terminal
autocmd("TermOpen", {
  group = augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

-- Auto-close terminal when process exits
autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})
