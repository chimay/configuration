-- vim: set filetype=lua:

-- plugins list {{{1

-- vim legacy {{{2

vim.pack.add({
	{ src = "https://github.com/justinmk/vim-sneak", version = "master" },
	{ src = "https://github.com/jiangmiao/auto-pairs", version = "master" },
	{ src = "https://github.com/Jorengarenar/miniSnip", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-user", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-entire", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-fold", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-function", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-indent", version = "master" },
	{ src = "https://github.com/kana/vim-textobj-line", version = "master" },
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
	{ src = "https://github.com/urbainvaes/vim-ripple", version = "master", },
	{ src = "https://github.com/mzlogin/vim-markdown-toc", version = "master", },
})

-- lua {{{2

vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim", version = "main" },
	{ src = "https://github.com/ibhagwan/fzf-lua.git", version = "main" },
	{ src = "https://github.com/MagicDuck/grug-far.nvim", version = "main", },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua", version = "master" },
	-- modules
	{ src = "https://github.com/nvim-mini/mini.nvim", version = "main", },
	--	treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main"},
	--	lsp : language server protocol
	{ src = 'https://github.com/neovim/nvim-lspconfig', version = "master" },
	-- dap : debug adapter protocol
	{ src = "https://github.com/mfussenegger/nvim-dap", version = "master" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python", version = "master" },
	{ src = "https://github.com/puremourning/vimspector", version = "master" },
	-- repl : read eval print loop
	{ src = "https://github.com/pappasam/nvim-repl", version = "main", },
})

-- with dependencies {{{2

vim.pack.add({
	-- telescope
	{ src = "https://github.com/nvim-lua/plenary.nvim", version = "master" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "master" },
})

-- local {{{2

-- personal plugins symlinked from local repos
-- to ~/racine/local/share/neovim/site/pack/symlinked/start

--vim.pack.add({
--{ src = "https://github.com/chimay/wheel", version = "master" },
--{ src = "https://github.com/chimay/organ", version = "main" },
--{ src = "https://github.com/chimay/vimscript-tricks", version = "main" },
--{ src = "https://codeberg.org/chimay/torustree", version = "master" },
--})

-- issues {{{2

-- issue with confirm prompt when cmdheight >= 3

-- vim.pack.add({
-- 	{ src = "https://github.com/folke/which-key.nvim", version = "main" },
-- 	{ src = "https://github.com/nvim-mini/mini.nvim", version = "main", },
-- }, { load = false })

-- setup {{{1

-- which-key {{{2

local which_key = require("which-key")

which_key.setup({
	win = {
		width = { max = 1200 },
		height = { max = 500 },
		no_overlap = true,
		col = 0.5,
	},
	layout = {
		width = { max = 50 },
		height = { max = 50 },
		spacing = 3,
	},
	keys = {
		scroll_up = "<f3>",
		scroll_down = "<f4>",
	},
})

which_key.add({
	-- leader
	{ "<leader>h", group = "help" },
	{ "<leader>e", group = "edit" },
	{ "<leader>o", group = "org mode" },
	{ "<leader>£", group = "latex" },
	{ "<leader>µ", group = "lilypond" },
	{ "<leader>f", group = "find" },
	{ "<leader>b", group = "buffer" },
	{ "<leader>a", group = "argument" },
	{ "<leader>w", group = "window" },
	{ "<leader>t", group = "tabpage" },
	{ "<leader>q", group = "quickfix" },
	{ "<leader>l", group = "location list" },
	{ "<leader>s", group = "search and replace" },
	{ "<leader>d", group = "display" },
	{ "<leader>T", group = "tags" },
	{ "<leader>g", group = "grep" },
	{ "<leader>=", group = "global operations" },
	{ "<leader>x", group = "cypher" },
	{ "<leader>$", group = "command" },
	{ "<leader>!", group = "file command" },
	{ "<leader>p", group = "plugin manager" },
	-- f11
	{ "<f11>m", group = "minimap" },
	{ "<f11>d", group = "diagnostic" },
	{ "<f11>i", group = "vimspector" },
	{ "<f11>!", group = "ripple" },
	{ "<f11>$", group = "repl" },
})

-- nvim-tree {{{2

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- default mappings
	api.map.on_attach.default(bufnr)
	-- custom mappings
	vim.keymap.set("n",          "?",              api.tree.toggle_help,               opts("Help"))
	vim.keymap.set("n",          "<",              api.node.navigate.parent,           opts("Parent Directory"))
	vim.keymap.set("n",          "-",              api.tree.change_root_to_parent,     opts("Up"))
	vim.keymap.set("n",          "h",              api.tree.change_root_to_node,       opts("CD here"))
	vim.keymap.set("n",          "=",              api.tree.change_root_to_node,       opts("CD here"))
	vim.keymap.set("n",          "<left>",         api.node.navigate.parent_close,     opts("Close Directory"))
	vim.keymap.set("n",          "<right>",        api.node.open.preview,              opts("Open Preview"))
	vim.keymap.set("n",          "z",              api.tree.collapse_all,              opts("Collapse All"))
	vim.keymap.set("n",          "e",              api.tree.expand_all,                opts("Expand All"))
	vim.keymap.set("n",          "s",              api.node.open.horizontal,           opts("Open: Horizontal Split"))
	vim.keymap.set("n",          "v",              api.node.open.vertical,             opts("Open: Vertical Split"))
	vim.keymap.set("n",          "t",              api.node.open.tab,                  opts("Open: New Tab"))
	vim.keymap.set("n",          "J",              api.node.navigate.sibling.next,     opts("Next Sibling"))
	vim.keymap.set("n",          "K",              api.node.navigate.sibling.prev,     opts("Previous Sibling"))
	vim.keymap.set("n",          "<pagedown>",     api.node.navigate.sibling.next,     opts("Next Sibling"))
	vim.keymap.set("n",          "<pageup>",       api.node.navigate.sibling.prev,     opts("Previous Sibling"))
	vim.keymap.set("n",          "<home>",         api.node.navigate.sibling.first,    opts("First Sibling"))
	vim.keymap.set("n",          "<end>",          api.node.navigate.sibling.last,     opts("Last Sibling"))
	vim.keymap.set("n",          "f",              api.filter.live.start,              opts("Live Filter: Start"))
	vim.keymap.set("n",          "&",              api.filter.live.start,              opts("Live Filter: Start"))
	vim.keymap.set("n",          "F",              api.filter.live.clear,              opts("Live Filter: Clear"))
	vim.keymap.set("n",          ",",              api.tree.search_node,               opts("Search"))
	vim.keymap.set("n",          ".",              api.filter.dotfiles.toggle,         opts("Toggle Filter: Dotfiles"))
	vim.keymap.set("n",          ";",              api.node.run.cmd,                   opts("Run Command"))
	-- default mappings
	--vim.keymap.set("n",          "<C-]>",          api.tree.change_root_to_node,       opts("CD"))
	--vim.keymap.set("n",          "<C-e>",          api.node.open.replace_tree_buffer,  opts("Open: In Place"))
	--vim.keymap.set("n",          "<C-k>",          api.node.show_info_popup,           opts("Info"))
	--vim.keymap.set("n",          "<C-r>",          api.fs.rename_sub,                  opts("Rename: Omit Filename"))
	--vim.keymap.set("n",          "<C-t>",          api.node.open.tab,                  opts("Open: New Tab"))
	--vim.keymap.set("n",          "<C-v>",          api.node.open.vertical,             opts("Open: Vertical Split"))
	--vim.keymap.set("n",          "<C-x>",          api.node.open.horizontal,           opts("Open: Horizontal Split"))
	--vim.keymap.set("n",          "<BS>",           api.node.navigate.parent_close,     opts("Close Directory"))
	--vim.keymap.set("n",          "<CR>",           api.node.open.edit,                 opts("Open"))
	--vim.keymap.set({ "n", "x" }, "<Del>",          api.fs.remove,                      opts("Delete"))
	--vim.keymap.set("n",          "<Tab>",          api.node.open.preview,              opts("Open Preview"))
	--vim.keymap.set("n",          ">",              api.node.navigate.sibling.next,     opts("Next Sibling"))
	--vim.keymap.set("n",          "<",              api.node.navigate.sibling.prev,     opts("Previous Sibling"))
	--vim.keymap.set("n",          ".",              api.node.run.cmd,                   opts("Run Command"))
	--vim.keymap.set("n",          "-",              api.tree.change_root_to_parent,     opts("Up"))
	--vim.keymap.set("n",          "a",              api.fs.create,                      opts("Create File Or Directory"))
	--vim.keymap.set("n",          "bd",             api.marks.bulk.delete,              opts("Delete Bookmarked"))
	--vim.keymap.set("n",          "bt",             api.marks.bulk.trash,               opts("Trash Bookmarked"))
	--vim.keymap.set("n",          "bmv",            api.marks.bulk.move,                opts("Move Bookmarked"))
	--vim.keymap.set("n",          "B",              api.filter.no_buffer.toggle,        opts("Toggle Filter: No Buffer"))
	--vim.keymap.set({ "n", "x" }, "c",              api.fs.copy.node,                   opts("Copy"))
	--vim.keymap.set("n",          "C",              api.filter.git.clean.toggle,        opts("Toggle Filter: Git Clean"))
	--vim.keymap.set("n",          "[c",             api.node.navigate.git.prev,         opts("Prev Git"))
	--vim.keymap.set("n",          "]c",             api.node.navigate.git.next,         opts("Next Git"))
	--vim.keymap.set({ "n", "x" }, "d",              api.fs.remove,                      opts("Delete"))
	--vim.keymap.set({ "n", "x" }, "D",              api.fs.trash,                       opts("Trash"))
	--vim.keymap.set("n",          "E",              api.tree.expand_all,                opts("Expand All"))
	--vim.keymap.set("n",          "e",              api.fs.rename_basename,             opts("Rename: Basename"))
	--vim.keymap.set("n",          "]e",             api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	--vim.keymap.set("n",          "[e",             api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	--vim.keymap.set("n",          "F",              api.filter.live.clear,              opts("Live Filter: Clear"))
	--vim.keymap.set("n",          "f",              api.filter.live.start,              opts("Live Filter: Start"))
	--vim.keymap.set("n",          "g?",             api.tree.toggle_help,               opts("Help"))
	--vim.keymap.set({ "n", "x" }, "gy",             api.fs.copy.absolute_path,          opts("Copy Absolute Path"))
	--vim.keymap.set("n",          "ge",             api.fs.copy.basename,               opts("Copy Basename"))
	--vim.keymap.set("n",          "H",              api.filter.dotfiles.toggle,         opts("Toggle Filter: Dotfiles"))
	--vim.keymap.set("n",          "I",              api.filter.git.ignored.toggle,      opts("Toggle Filter: Git Ignored"))
	--vim.keymap.set("n",          "J",              api.node.navigate.sibling.last,     opts("Last Sibling"))
	--vim.keymap.set("n",          "K",              api.node.navigate.sibling.first,    opts("First Sibling"))
	--vim.keymap.set("n",          "L",              api.node.open.toggle_group_empty,   opts("Toggle Group Empty"))
	--vim.keymap.set("n",          "M",              api.filter.no_bookmark.toggle,      opts("Toggle Filter: No Bookmark"))
	--vim.keymap.set({ "n", "x" }, "m",              api.marks.toggle,                   opts("Toggle Bookmark"))
	--vim.keymap.set("n",          "o",              api.node.open.edit,                 opts("Open"))
	--vim.keymap.set("n",          "O",              api.node.open.no_window_picker,     opts("Open: No Window Picker"))
	--vim.keymap.set("n",          "p",              api.fs.paste,                       opts("Paste"))
	--vim.keymap.set("n",          "gp",             api.fs.move,                        opts("Move"))
	--vim.keymap.set("n",          "P",              api.node.navigate.parent,           opts("Parent Directory"))
	--vim.keymap.set("n",          "q",              api.tree.close,                     opts("Close"))
	--vim.keymap.set("n",          "r",              api.fs.rename,                      opts("Rename"))
	--vim.keymap.set("n",          "R",              api.tree.reload,                    opts("Refresh"))
	--vim.keymap.set("n",          "s",              api.node.run.system,                opts("Run System"))
	--vim.keymap.set("n",          "S",              api.tree.search_node,               opts("Search"))
	--vim.keymap.set("n",          "u",              api.fs.rename_full,                 opts("Rename: Full Path"))
	--vim.keymap.set("n",          "U",              api.filter.custom.toggle,           opts("Toggle Filter: Custom"))
	--vim.keymap.set("n",          "W",              api.tree.collapse_all,              opts("Collapse All"))
	--vim.keymap.set({ "n", "x" }, "x",              api.fs.cut,                         opts("Cut"))
	--vim.keymap.set("n",          "y",              api.fs.copy.filename,               opts("Copy Name"))
	--vim.keymap.set("n",          "Y",              api.fs.copy.relative_path,          opts("Copy Relative Path"))
	--vim.keymap.set("n",          "<2-LeftMouse>",  api.node.open.edit,                 opts("Open"))
	--vim.keymap.set("n",          "<2-RightMouse>", api.tree.change_root_to_node,       opts("CD"))
end

local config = {
	respect_buf_cwd = true,
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 70,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	on_attach = my_on_attach,
}

require("nvim-tree").setup(config)

-- modules {{{2

-- mini {{{3

require('mini.map').setup(
{
  -- Highlight integrations (none by default)
  integrations = nil,
  -- Symbols used to display data
  symbols = {
    -- Encode symbols. See `:h MiniMap.config` for specification and
    -- `:h MiniMap.gen_encode_symbols` for pre-built ones.
    -- Default: solid blocks with 3x2 resolution.
    encode = nil,
    -- Scrollbar parts for view and line. Use empty string to disable any.
    scroll_line = '█',
    scroll_view = '┃',
  },
  -- Window options
  window = {
    -- Whether window is focusable in normal way (with `wincmd` or mouse)
    focusable = false,
    -- Side to stick ('left' or 'right')
    side = 'right',
    -- Whether to show count of multiple integration highlights
    show_integration_count = true,
    -- Total width
    width = 10,
    -- Value of 'winblend' option
    winblend = 25,
    -- Z-index
    zindex = 10,
  },
})

-- require('mini.cmdline').setup(
-- {
--   -- Autocompletion: show `:h 'wildmenu'` as you type
--   autocomplete = {
--     enable = false,
--     -- Delay (in ms) after which to trigger completion
--     -- Neovim>=0.12 is recommended for positive values
--     delay = 0,
--     -- Custom rule of when to trigger completion
--     predicate = nil,
--     -- Whether to map arrow keys for more consistent wildmenu behavior
--     map_arrows = true,
--   },
--   -- Autocorrection: adjust non-existing words (commands, options, etc.)
--   autocorrect = {
--     enable = false,
--     -- Custom autocorrection rule
--     func = nil,
--   },
--   -- Autopeek: show command's target range in a floating window
--   autopeek = {
--     enable = true,
--     -- Number of lines to show above and below range lines
--     n_context = 1,
--     -- Custom rule of when to show peek window
--     predicate = nil,
--     -- Window options
--     window = {
--       -- Floating window config
--       config = {},
--       -- Function to render statuscolumn
--       statuscolumn = nil,
--     },
--   },
-- }
-- )

-- see ../../paquet/preload.vim for the maps

-- treesitter {{{2

local nvim_treesitter = require('nvim-treesitter')

nvim_treesitter.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

nvim_treesitter.install { 'python' }

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

-- language server protocol {{{2

vim.lsp.enable('pyright')

vim.api.nvim_set_keymap(
	'n', '<f11>dd', '<cmd>lua vim.diagnostic.open_float()<CR>',
	{ noremap = true, silent = true
})

vim.api.nvim_set_keymap(
	'n', '<f11>dn', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
	{ noremap = true, silent = true
})

vim.api.nvim_set_keymap(
	'n', '<f11>dp', '<cmd>lua vim.diagnostic.goto_next()<CR>',
	{ noremap = true, silent = true
})

-- The following command requires plug-ins "nvim-telescope/telescope.nvim",
-- "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for
-- icon support

vim.api.nvim_set_keymap(
	'n', '<f11>dt', '<cmd>Telescope diagnostics<CR>',
	{ noremap = true, silent = true
})

-- If you don't want to use the telescope plug-in but still want to see all the
-- errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua
-- vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- debug adapter protocol {{{2

-- If using this, then `python3 -m debugpy --version`
-- must work in the shell

require("dap-python").setup("python3")

-- read eval print loop {{{2

require("repl").setup({
	filetype_commands = {
		python = {cmd = "python"},
		javascript = {cmd = "deno repl"},
	},
	default = {cmd = "zsh", filetype = "zsh"},
	open_window_default = "vnew",
})
