-- vim: set filetype=lua:

-- documentation {{{1

-- example
--require "paq" {
    --"savq/paq-nvim", -- Let Paq manage itself
    --"neovim/nvim-lspconfig",
    --{ "lervag/vimtex", opt = true }, -- Use braces when passing options
    --{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
--}

-- documentation
--
-- Option	Type
-- as	string	Name to use for the package locally
-- branch	string	Branch of the repository
-- build	function	Lua function to run after install/update
-- build	string	Shell command to run after install/update
-- build	string	Prefixed with a ':' will run a vim command
-- opt	boolean	Optional packages are not loaded on startup
-- pin	boolean	Pinned packages are not updated
-- url	string	URL of the remote repository, useful for non-GitHub repos

-- list of packages {{{1

require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself
    {"nvim-treesitter/nvim-treesitter", run=':TSUpdate'},
	{'nvim-treesitter/nvim-treesitter-textobjects'},
}

-- mappings {{{1

local map = vim.keymap.set

map('n' , '<f12>I'     , '<cmd>PaqInstall<cr>'  , { desc = 'paq install' })
map('n' , '<f12>U'     , '<cmd>PaqUpdate<cr>'   , { desc = 'paq update' })
map('n' , '<f12>S'     , '<cmd>PaqSync<cr>'     , { desc = 'paq sync' })
map('n' , '<f12>B'     , '<cmd>PaqBuild<cr>'    , { desc = 'paq build' })
map('n' , '<f12>L'     , '<cmd>PaqList<cr>'     , { desc = 'paq list' })
map('n' , '<f12><m-l>' , '<cmd>PaqLogOpen<cr>'  , { desc = 'paq log open' })
map('n' , '<f12>C'     , '<cmd>PaqClean<cr>'    , { desc = 'paq clean' })
map('n' , '<f12><m-c>' , '<cmd>PaqLogClean<cr>' , { desc = 'paq log clean' })

-- configuration {{{1

-- treesitter {{{2

local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
	highlight = { enable = true },
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["ao"] = "@loop.outer",
				["io"] = "@loop.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["a#"] = "@comment.outer",
				["i#"] = "@comment.inner",
				-- You can optionally set descriptions to the mappings (used in the desc parameter of
				-- nvim_buf_set_keymap) which plugins like which-key display
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				-- You can also use captures from other query groups like `locals.scm`
				["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				['@parameter.outer'] = 'v', -- charwise
				['@function.outer'] = 'V', -- linewise
				['@class.outer'] = '<c-v>', -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true or false
			include_surrounding_whitespace = false,
		},
		swap = {
			enable = true,
			swap_next = {
				["<f2>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<f2>A"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[")c"] = { query = "@class.outer", desc = "Next class start" },
				[")("] = "@function.outer",
				[")a"] = "@parameter.outer",
				[")b"] = "@block.outer",
				[")o"] = "@loop.outer",
				--
				-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
				--[")o"] = "@loop.*",
				-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
				--
				-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
				-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
				[")s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
				[")z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
			},
			goto_next_end = {
				[")C"] = "@class.outer",
				["))"] = "@function.outer",
				[")A"] = "@parameter.outer",
				[")B"] = "@block.outer",
				[")O"] = "@loop.outer",
			},
			goto_previous_start = {
				["(c"] = "@class.outer",
				["(("] = "@function.outer",
				["(a"] = "@parameter.outer",
				["(b"] = "@block.outer",
				["(o"] = "@loop.outer",
			},
			goto_previous_end = {
				["(C"] = "@class.outer",
				["()"] = "@function.outer",
				["(A"] = "@parameter.outer",
				["(B"] = "@block.outer",
				["(O"] = "@loop.outer",
			},
			-- Below will go to either the start or the end, whichever is closer.
			-- Use if you want more granular movements
			-- Make it even more gradual by adding multiple queries and regex.
			goto_next = {
				[")i"] = "@conditional.outer",
			},
			goto_previous = {
				["(I"] = "@conditional.outer",
			},
		},
	},
}
