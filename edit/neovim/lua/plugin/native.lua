-- vim: set filetype=lua:

vim.pack.add({
	"https://github.com/folke/which-key.nvim",
	"https://github.com/ibhagwan/fzf-lua.git",
	"https://github.com/justinmk/vim-sneak",
	"https://github.com/jiangmiao/auto-pairs",
	"https://github.com/Jorengarenar/miniSnip",
	"https://github.com/kana/vim-textobj-entire",
	"https://github.com/kana/vim-textobj-fold",
	"https://github.com/kana/vim-textobj-function",
	"https://github.com/kana/vim-textobj-indent",
	"https://github.com/kana/vim-textobj-line",
	"https://github.com/kana/vim-textobj-user",
	"https://github.com/machakann/vim-highlightedyank",
	"https://github.com/nishigori/increment-activator",
	"https://github.com/scrooloose/nerdcommenter",
	"https://github.com/thinca/vim-textobj-comment",
	"https://github.com/tommcdo/vim-exchange",
	"https://github.com/tomtom/tcomment_vim",
	"https://github.com/tpope/vim-repeat",
	"https://github.com/tpope/vim-surround",
	"https://github.com/urbainvaes/vim-ripple",
	"https://github.com/vim-scripts/CmdlineComplete",
	"https://github.com/vim-scripts/DeleteTrailingWhitespace",
	"https://github.com/vim-scripts/VisIncr",
	"https://github.com/vim-scripts/utl.vim",
	"https://github.com/wellle/targets.vim",
	"https://github.com/McSinyx/vim-octave",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/vifm/vifm.vim",
	"https://github.com/flazz/vim-colorschemes",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
--	treesitter
	"https://github.com/nvim-treesitter/nvim-treesitter",
--	language server protocol
	{ src = 'https://github.com/neovim/nvim-lspconfig', },
-- 	personal plugins
	{ src = "https://github.com/chimay/wheel", version = "master" },
	{ src = "https://github.com/chimay/organ", version = "main" },
	{ src = "https://github.com/chimay/vimscript-tricks", version = "main" },
	{ src = "https://codeberg.org/chimay/torustree", version = "master" },
})

-- treesitter

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

-- language server protocol

vim.lsp.enable('pyright')
