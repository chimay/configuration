-- vim: set filetype=lua :

return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function ()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<s-space>f', builtin.find_files, { desc = 'telescope find files' })
	end
}
