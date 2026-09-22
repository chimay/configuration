-- vim: set filetype=lua:

-- plugins list {{{1

vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim", version = "main" },
	{ src = "https://github.com/ibhagwan/fzf-lua.git", version = "main" },
	{ src = "https://github.com/nvim-lua/plenary.nvim", version = "master" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "master" },
	{ src = "https://github.com/justinmk/vim-sneak", version = "master" },
	{ src = "https://github.com/jiangmiao/auto-pairs", version = "master" },
	{ src = "https://github.com/Jorengarenar/miniSnip", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-entire", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-fold", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-function", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-indent", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-line", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-user", version = "master" },
	{ src = "https://github.com/machakann/vim-highlightedyank", version = "master" },
	{ src = "https://github.com/nishigori/increment-activator", version = "master" },
	{ src = "https://github.com/scrooloose/nerdcommenter", version = "master", },
	{ src = "https://github.com/thinca/vim-textobj-comment", version = "master" },
	{ src = "https://github.com/tommcdo/vim-exchange", version = "master", },
	{ src = "https://github.com/tomtom/tcomment_vim", version = "master", },
	{ src = "https://github.com/tpope/vim-repeat", version = "master", },
	{ src = "https://github.com/tpope/vim-surround", version = "master", },
	{ src = "https://github.com/vim-scripts/CmdlineComplete", version = "master", },
	{ src = "https://github.com/vim-scripts/DeleteTrailingWhitespace", version = "master", },
	{ src = "https://github.com/vim-scripts/VisIncr", version = "master", },
	{ src = "https://github.com/vim-scripts/utl.vim", version = "master", },
	{ src = "https://github.com/wellle/targets.vim", version = "master", },
	{ src = "https://github.com/McSinyx/vim-octave", version = "master", },
	{ src = "https://github.com/christoomey/vim-tmux-navigator", version = "master", },
	{ src = "https://github.com/vifm/vifm.vim", version = "master", },
	{ src = "https://github.com/flazz/vim-colorschemes", version = "master", },
	{ src = "https://github.com/MagicDuck/grug-far.nvim", version = "main", },
	--	treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main"},
	--	lsp : language server protocol
	{ src = 'https://github.com/neovim/nvim-lspconfig', version = "master" },
	-- dap : debug adapter protocol
	{ src = "https://github.com/mfussenegger/nvim-dap", version = "master" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python", version = "master" },
	-- repl : read eval print loop
	{ src = "https://github.com/urbainvaes/vim-ripple", version = "master", },
	{ src = "https://github.com/pappasam/nvim-repl", version = "main", },
	-- 	personal plugins
	{ src = "https://github.com/chimay/wheel", version = "master" },
	{ src = "https://github.com/chimay/organ", version = "main" },
	{ src = "https://github.com/chimay/vimscript-tricks", version = "main" },
	{ src = "https://codeberg.org/chimay/torustree", version = "master" },
})

-- treesitter {{{1

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'python' }

vim.api.nvim_create_autocmd('FileType', {
	group = treesitter,
	pattern = { 'python' },
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo[0][0].foldmethod = 'expr'
	end,
})

-- language server protocol {{{1

vim.lsp.enable('pyright')

vim.api.nvim_set_keymap(
	'n', '<s-space>ed', '<cmd>lua vim.diagnostic.open_float()<CR>',
	{ noremap = true, silent = true
})

vim.api.nvim_set_keymap(
	'n', '<s-space>en', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
	{ noremap = true, silent = true
})

vim.api.nvim_set_keymap(
	'n', '<s-space>ep', '<cmd>lua vim.diagnostic.goto_next()<CR>',
	{ noremap = true, silent = true
})

-- The following command requires plug-ins "nvim-telescope/telescope.nvim",
-- "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for
-- icon support

vim.api.nvim_set_keymap(
	'n', '<s-space>et', '<cmd>Telescope diagnostics<CR>',
	{ noremap = true, silent = true
})

-- If you don't want to use the telescope plug-in but still want to see all the
-- errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua
-- vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- debug adapter protocol {{{1

-- If using this, then `python3 -m debugpy --version`
-- must work in the shell

require("dap-python").setup("python3")

-- read eval print loop {{{1

require("repl").setup({
	filetype_commands = {
		python = {cmd = "python"},
		javascript = {cmd = "deno repl"},
	},
	default = {cmd = "zsh", filetype = "zsh"},
	open_window_default = "vnew",
})

