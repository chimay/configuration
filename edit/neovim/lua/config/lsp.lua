-- vim: set filetype=lua:

-- lsp servers {{{1

---- no need to call it with mason-lspconfig

-- vim.lsp.enable('lua_ls')
-- vim.lsp.enable('stylua')
-- vim.lsp.enable('vimls')
-- vim.lsp.enable('pyright')

-- local servers = {
-- 	stylua = {},
-- 	lua_ls = {},
-- 	vimls = {},
-- 	pyright = {},
-- }

---- vim.lsp.config is not necessary with nvim-lspconfig

-- for name, server in pairs(servers) do
-- 	vim.lsp.config(name, server)
-- 	vim.lsp.enable(name)
-- end

-- completion {{{1

-- issue with - autocompleted even when not wished
-- use cmp plugin instead

-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if client ~= nil and client:supports_method("textDocument/completion") then
--             vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--         end
--     end,
-- })

-- description hovering {{{1

-- also use K, c-],
-- c-w c-w, tnen c-w T

-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if not client or not client:supports_method("textDocument/hover") then
--             return
--         end
--         vim.api.nvim_create_autocmd("CursorHold", {
--             buffer = ev.buf,
--             callback = function()
--                 vim.lsp.buf.hover({
--                     focus = false,
--                     silent = true,
--                 })
--             end,
--         })
--     end,
-- })

-- virtual text {{{1

vim.diagnostic.config({ virtual_text = false })

-- maps {{{1

---- see :help lsp-defaults

-- - "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
-- - "gri" is mapped to |vim.lsp.buf.implementation()|
-- - "grn" is mapped to |vim.lsp.buf.rename()|
-- - "grr" is mapped to |vim.lsp.buf.references()|
-- - "grt" is mapped to |vim.lsp.buf.type_definition()|
-- - "grx" is mapped to |vim.lsp.codelens.run()|
-- - "gO" is mapped to |vim.lsp.buf.document_symbol()|
-- - CTRL-S (Insert mode) is mapped to |vim.lsp.buf.signature_help()|
-- - |v_an| and |v_in| fall back to LSP |vim.lsp.buf.selection_range()| if
--   treesitter is not active.
-- - |gx| handles `textDocument/documentLink`. Example: with gopls, invoking gx
--   on "os" in this Go code will open documentation externally: >
--     package nvim
--     import (
--        "os"
--     )

---- see :help diagnostic-defaults

-- These diagnostic keymaps are created unconditionally when Nvim starts:
-- - `]d` jumps to the next diagnostic in the buffer. |]d-default|
-- - `[d` jumps to the previous diagnostic in the buffer. |[d-default|
-- - `]D` jumps to the last diagnostic in the buffer. |]D-default|
-- - `[D` jumps to the first diagnostic in the buffer. |[D-default|
-- - `<C-w>d` shows diagnostic at cursor in a floating window. |CTRL-W_d-default|

---- not needed any more

-- map("n", "[d", vim.diagnostic.goto_prev,          { desc = "Previous diagnostic" })
-- map("n", "]d", vim.diagnostic.goto_next,          { desc = "Next diagnostic" })
-- map("n", "K",  vim.lsp.buf.hover,            { desc = "LSP: Hover documentation" })
-- map("n", "<f11>lf", vim.diagnostic.open_float,  { desc = "Show diagnostic" })
-- map('n', '<f11>ll', telescope_builtin.diagnostics, { desc = 'Telescope diagnostics' })
-- map("n", "<f11>ldd", vim.lsp.buf.definition,      { desc = "LSP: Go to definition" })
-- map("n", "<f11>ldc", vim.lsp.buf.declaration,     { desc = "LSP: Go to declaration" })
-- map("n", "<f11>lds", vim.lsp.buf.document_symbol, { desc = "LSP: Document symbols" })
-- map("n", "<f11>lw", vim.lsp.buf.workspace_symbol, { desc = "LSP: Workspace symbols" })

-- theme {{{1

local diagnostic_hl_group = vim.api.nvim_create_augroup("DiagnosticHighlights", { clear = true })

local function diagnostic_hl()
	vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#872e30" })
	vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#5b3c11" })
	vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = "#5b3c11" })
	vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#5b3c11" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
		underline = true,
		undercurl = false,
		sp = "#872e30",
	})
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
		underline = false,
		sp = "#e5c07b",
	})
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
		underline = false,
		sp = "#5b3c11",
	})
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
		underline = false,
		sp = "#5b3c11",
	})
end

vim.api.nvim_create_autocmd("ColorScheme", {
	group = diagnostic_hl_group,
	callback = diagnostic_hl,
})

diagnostic_hl()
