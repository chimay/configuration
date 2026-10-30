-- vim: set filetype=lua:

-- netrw {{{1

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- shortcuts {{{1

local map = vim.keymap.set

-- vim pack add {{{1

-- libraries {{{2

vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim", version = "main", },
	{ src = "https://github.com/nvim-lua/plenary.nvim", version = "master" },
	{ src =  'https://github.com/nvim-neotest/nvim-nio',  version =  "master" },
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons', version = "master" },
})

-- vim legacy {{{2

vim.pack.add({
	{ src = 'https://github.com/justinmk/vim-sneak', version = "master" },
	{ src = 'https://github.com/jiangmiao/auto-pairs', version = "master" },
	{ src = 'https://github.com/Jorengarenar/miniSnip', version = "master" },
	{ src = 'https://github.com/kana/vim-textobj-user', version = "master" },
	{ src = 'https://github.com/kana/vim-textobj-entire', version = "master" },
	{ src = 'https://github.com/kana/vim-textobj-fold', version = "master" },
	{ src = 'https://github.com/kana/vim-textobj-function', version = "master" },
	{ src = 'https://github.com/kana/vim-textobj-indent', version = "master" },
	{ src = 'https://github.com/kana/vim-textobj-line', version = "master" },
	{ src = 'https://github.com/machakann/vim-highlightedyank', version = "master" },
	{ src = 'https://github.com/nishigori/increment-activator', version = "master" },
	{ src = 'https://github.com/scrooloose/nerdcommenter', version = "master", },
	{ src = 'https://github.com/thinca/vim-textobj-comment', version = "master" },
	{ src = 'https://github.com/tommcdo/vim-exchange', version = "master", },
	{ src = 'https://github.com/tomtom/tcomment_vim', version = "master", },
	{ src = 'https://github.com/tpope/vim-repeat', version = "master", },
	{ src = 'https://github.com/tpope/vim-surround', version = "master", },
	{ src = 'https://github.com/vim-scripts/CmdlineComplete', version = "master", },
	{ src = 'https://github.com/vim-scripts/DeleteTrailingWhitespace', version = "master", },
	{ src = 'https://github.com/vim-scripts/VisIncr', version = "master", },
	{ src = 'https://github.com/vim-scripts/utl.vim', version = "master", },
	{ src = 'https://github.com/wellle/targets.vim', version = "master", },
	{ src = 'https://github.com/McSinyx/vim-octave', version = "master", },
	{ src = 'https://github.com/christoomey/vim-tmux-navigator', version = "master", },
	{ src = 'https://github.com/vifm/vifm.vim', version = "master", },
	{ src = 'https://github.com/flazz/vim-colorschemes', version = "master", },
	{ src = 'https://github.com/mzlogin/vim-markdown-toc', version = "master", },
})

-- lua generic {{{2

vim.pack.add({
	{ src = 'https://github.com/folke/which-key.nvim', version = "main" },
	{ src = 'https://github.com/ibhagwan/fzf-lua.git', version = "main" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "master" },
	{ src = "https://github.com/nvim-telescope/telescope-file-browser.nvim", version = "master" },
	{ src = 'https://github.com/nvim-tree/nvim-tree.lua', version = "master" },
	{ src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = "main" },
	{ src = 'https://github.com/stevearc/oil.nvim', version = "master" },
	{ src = 'https://github.com/ThePrimeagen/harpoon', version = "harpoon2" },
	{ src = 'https://github.com/jiaoshijie/undotree', version = "main" },
	{ src = 'https://github.com/MagicDuck/grug-far.nvim', version = "main", },
})

-- interface {{{2

-- vim.pack.add({
-- })

-- treesitter {{{2

vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = "main"},
	{ src = "https://github.com/MeanderingProgrammer/treesitter-modules.nvim" },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = "main"},
	{ src = 'https://github.com/Wansmer/treesj', version = "main"},
})

-- mason {{{2

-- easier lsp and dap

vim.pack.add({
	{ src = 'https://github.com/mason-org/mason.nvim', version = "main" },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim', version = "main" },
	{ src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim', version = "main" },
})

-- lsp : language server protocol {{{2

vim.pack.add({
	{ src = 'https://github.com/neovim/nvim-lspconfig', version = "master" },
	{ src = 'https://github.com/antosha417/nvim-lsp-file-operations', version = "master" },
	{ src = 'https://github.com/folke/lazydev.nvim', version = "main" },
})

-- dap : debug adapter protocol {{{2

vim.pack.add({
	{ src = 'https://github.com/mfussenegger/nvim-dap', version = "master" },
	{ src = 'https://github.com/rcarriga/nvim-dap-ui', version = "master" },
	{ src = 'https://github.com/mfussenegger/nvim-dap-python', version = "master" },
})

-- snippets {{{2

vim.pack.add({
	{ src = 'https://github.com/L3MON4D3/LuaSnip', version = "master" },
	{ src = 'https://github.com/rafamadriz/friendly-snippets', version = "main" },
	{ src = 'https://github.com/saadparwaiz1/cmp_luasnip', version = "master" },
})

-- completion {{{2

vim.pack.add({
	{ src = 'https://github.com/hrsh7th/nvim-cmp', version = "main" },
	{ src = 'https://github.com/hrsh7th/cmp-nvim-lsp', version = "main" },
	{ src = 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help', version = "main" },
})

-- terminal {{{2

vim.pack.add({
	{ src = 'https://github.com/akinsho/toggleterm.nvim', version = "main" },
})

-- repl : read eval print loop {{{2

vim.pack.add({
	{ src = 'https://github.com/Vigemus/iron.nvim', version = "master", },
	--{ src = 'https://github.com/milanglacier/yarepl.nvim', version = "main", },
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

-- colorschemes {{{2

vim.pack.add({
	{ src = 'https://github.com/vague-theme/vague.nvim', version = "main" },
})

-- setup {{{1

-- libraries {{{2

-- mini {{{3

require('mini.map').setup({
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

-- mappings {{{2

-- which-key {{{3

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
	{ "<leader>v", group = "neovim" },
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
	{ "<leader>l", group = "lang serv prot" },
	{ "<leader>L", group = "location list" },
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
	{ "<f11>l", group = "lang serv prot" },
	{ "<f11>s", group = "swap" },
	{ "<f11>t", group = "telescope" },
	{ "<f11>D", group = "debug adapt prot" },
	{ "<f11>!", group = "ripple" },
	{ "<f11>$", group = "repl" },
})

-- multi explorers {{{2

-- telescope {{{3

require('telescope').setup({
    extensions = {
        fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
        }
    }
})

-- file explorer {{{2

-- nvim-tree {{{3

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

-- oil {{{3

require("oil").setup({
	default_file_explorer = false,
})

-- harpoon {{{3

local harpoon = require("harpoon")

harpoon:setup()

---- C-1,2,3,...

vim.keymap.set("n", "<C-&>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-é>", function() harpoon:list():select(2) end)
vim.keymap.set("n", '<C-">', function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-'>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<c-à>", function() harpoon:list():add() end)
vim.keymap.set("n", "<c-->", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<c-(>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<c-)>", function() harpoon:list():next() end)

-- undo {{{2

-- undotree {{{3

require('undotree').setup({
    float_diff = true,
    layout = "left_bottom",
    position = "left",
    window = {
        width = 0.25,
        height = 0.25,
        border = "rounded",
    },
    ignore_filetype = {},
    parser = "compact",
    keymaps = {
        ["move_next"] = "j",
        ["move_prev"] = "k",
        ["move2parent"] = "gj",
        ["move_change_next"] = "J",
        ["move_change_prev"] = "K",
        ["action_enter"] = "<cr>",
        ["enter_diffbuf"] = "p",
        ["quit"] = "q",
        ["update_undotree_view"] = "S",
    },
})

vim.keymap.set('n', '<f11>u', require('undotree').toggle, { silent = true, desc = 'undotree' })

-- treesitter {{{2

-- nvim-treesitter {{{3

local nvim_treesitter = require('nvim-treesitter')

nvim_treesitter.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

nvim_treesitter.install {
	'lua',
	'vim',
	'vimdoc',
	'bash',
	'zsh',
	'python',
}

vim.treesitter.language.register('bash', { 'sh' })

local treesitter_group = vim.api.nvim_create_augroup('treesitter', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
	group = treesitter_group,
	pattern = 'python',
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo[0][0].foldmethod = 'expr'
	end,
})

-- nvim-treesitter-modules {{{3

---- default

-- require("treesitter-modules").setup({
-- 	incremental_selection = {
-- 		enable = true,
-- 		keymaps = {
-- 			init_selection = "gnn", -- Normal mode
-- 			scope_incremental = "grc", -- Visual mode
-- 			node_incremental = "grn", -- Visual mode
-- 			node_decremental = "grm", -- Visual mode
-- 			node_incremental = "an", -- Visual mode
-- 			node_decremental = "in", -- Visual mode
-- 		},
-- 	},
-- })

-- nvim-treesitter-textobjects {{{3

require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    selection_modes = {
      ["@parameter.outer"] = "v",
      ["@function.outer"] = "V",
      ["@loop.outer"] = "V",
      ["@conditional.outer"] = "V",
    },
  },
  move = {
    set_jumps = true,
  },
})

-- select {{{4

local select = require("nvim-treesitter-textobjects.select")

local select_maps = {
  ["a="] = { "@assignment.outer", "Select outer assignment" },
  ["i="] = { "@assignment.inner", "Select inner assignment" },
  ["l="] = { "@assignment.lhs", "Select assignment left-hand side" },
  ["r="] = { "@assignment.rhs", "Select assignment right-hand side" },
  ["a:"] = { "@property.outer", "Select outer property" },
  ["i:"] = { "@property.inner", "Select inner property" },
  ["l:"] = { "@property.lhs", "Select property left-hand side" },
  ["r:"] = { "@property.rhs", "Select property right-hand side" },
  ["aa"] = { "@parameter.outer", "Select outer parameter" },
  ["ia"] = { "@parameter.inner", "Select inner parameter" },
  ["ac"] = { "@conditional.outer", "Select outer conditional" },
  ["ic"] = { "@conditional.inner", "Select inner conditional" },
  -- l taken by line
  ["ao"] = { "@loop.outer", "Select outer loop" },
  ["io"] = { "@loop.inner", "Select inner loop" },
  ["aM"] = { "@call.outer", "Select outer call" },
  ["iM"] = { "@call.inner", "Select inner call" },
  ["am"] = { "@function.outer", "Select outer function" },
  ["im"] = { "@function.inner", "Select inner function" },
  ["aC"] = { "@class.outer", "Select outer class" },
  ["iC"] = { "@class.inner", "Select inner class" },
}

for key, spec in pairs(select_maps) do
  vim.keymap.set({ "x", "o" }, key, function()
    select.select_textobject(spec[1], "textobjects")
  end, { desc = spec[2] })
end

-- move {{{4

local move = require("nvim-treesitter-textobjects.move")

map({ "n", "x", "o" }, "]m", function()
  move.goto_next_start("@function.outer", "textobjects")
end, { desc = "goto next function start" })

map({ "n", "x", "o" }, "[m", function()
  move.goto_previous_start("@function.outer", "textobjects")
end, { desc = "goto previous function start" })

map({ "n", "x", "o" }, "]M", function()
  move.goto_next_end("@function.outer", "textobjects")
end, { desc = "goto previous function end" })

map({ "n", "x", "o" }, "[M", function()
  move.goto_previous_end("@function.outer", "textobjects")
end, { desc = "goto previous function end" })

map({ "n", "x", "o" }, "]o", function()
  move.goto_next_start("@loop.outer", "textobjects")
end)
map({ "n", "x", "o" }, "[o", function()
  move.goto_previous_start("@loop.outer", "textobjects")
end)

---- ᄠ= alt gr c

map({ "n", "x", "o" }, "]ᄠ", function()
  move.goto_next_start("@conditional.outer", "textobjects")
end)
map({ "n", "x", "o" }, "[ᄠ", function()
  move.goto_previous_start("@conditional.outer", "textobjects")
end)

-- swap {{{4

map("n", "<f11>sa", function()
  require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
end, { desc = "swap inner arguments" })

map("n", "<f11>sA", function()
  require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
end, { desc = "swap outer arguments" })

-- treesj {{{3

local tsj = require('treesj')

--local langs = {[> configuration for languages <]}

tsj.setup({
  use_default_keymaps = true,
  check_syntax_error = true,
  max_join_length = 120,
  ---Cursor behavior:
  ---hold - cursor follows the node/place on which it was called
  ---start - cursor jumps to the first symbol of the node being formatted
  ---end - cursor jumps to the last symbol of the node being formatted
  cursor_behavior = 'hold',
  notify = true,
  dot_repeat = true,
  on_error = nil,
  -- langs = {}, -- See the default presets in lua/treesj/langs
})

vim.keymap.set('n', '<f11>j', require('treesj').toggle)
vim.keymap.set('n', '<f11>J', function()
    require('treesj').toggle({ split = { recursive = true } })
end)

-- mason {{{2

require("mason").setup()

-- mason tool installer {{{3

require('mason-tool-installer').setup {
	ensure_installed = {
		"lua_ls",
		'lua-language-server',
		'stylua',
		'vimls',
		'vim-language-server',
		'pyright',
		'bash-language-server',
		'editorconfig-checker',
		'shellcheck',
		'shfmt',
		'vint',
	},
	integrations = {
		['mason-lspconfig'] = true,
		['mason-null-ls'] = true,
		['mason-nvim-dap'] = true,
	},
}

-- mason lspconfig {{{3

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		'stylua',
		'vimls',
		'pyright',
		"bashls",
	},
	automatic_enable = {
		exclude = {
			--'lua_ls',
			--"bashls",
		},
	},
})

-- lsp : language server protocol {{{2

-- lspconfig {{{3

-- theme {{{3

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

-- lsp servers {{{3

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

-- lsp completion {{{3

-- issue with - autocompleted even when not wished

-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if client ~= nil and client:supports_method("textDocument/completion") then
--             vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--         end
--     end,
-- })

-- lsp description hovering {{{3

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

-- lsp maps {{{3

vim.diagnostic.config({ virtual_text = true })

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

--local telescope_builtin = require('telescope.builtin')

-- map("n", "[d", vim.diagnostic.goto_prev,          { desc = "Previous diagnostic" })
-- map("n", "]d", vim.diagnostic.goto_next,          { desc = "Next diagnostic" })
-- map("n", "K",  vim.lsp.buf.hover,            { desc = "LSP: Hover documentation" })
-- map("n", "<f11>lf", vim.diagnostic.open_float,  { desc = "Show diagnostic" })
-- map('n', '<f11>ll', telescope_builtin.diagnostics, { desc = 'Telescope diagnostics' })
-- map("n", "<f11>ldd", vim.lsp.buf.definition,      { desc = "LSP: Go to definition" })
-- map("n", "<f11>ldc", vim.lsp.buf.declaration,     { desc = "LSP: Go to declaration" })
-- map("n", "<f11>lds", vim.lsp.buf.document_symbol, { desc = "LSP: Document symbols" })
-- map("n", "<f11>lw", vim.lsp.buf.workspace_symbol, { desc = "LSP: Workspace symbols" })

-- dap : debug adapter protocol {{{2

-- If using this, then `python3 -m debugpy --version`
-- must work in the shell

require("dap-python").setup("python3")

-- dap ui {{{3

require("dapui").setup()

-- snippets {{{2

-- luasnip {{{3

local luasnip = require("luasnip")

luasnip.config.setup({
	enable_autosnippets = false,
})

require("luasnip.loaders.from_vscode").lazy_load()

-- mappings {{{3

-- see also <url:#tn=cmp>

vim.keymap.set({ "i", "s" }, "<m-j>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, {silent = true})

vim.keymap.set({ "i", "s" }, "<m-k>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, {silent = true})

vim.keymap.set({ "i", "s" }, "<m-c>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, {silent = true})

-- custom snippets {{{3

-- local luasnip = require("luasnip")
-- local s = luasnip.snippet
-- local sn = luasnip.snippet_node
-- local isn = luasnip.indent_snippet_node
-- local t = luasnip.text_node
-- local i = luasnip.insert_node
-- local f = luasnip.function_node
-- local c = luasnip.choice_node
-- local d = luasnip.dynamic_node
-- local r = luasnip.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local opt = require("luasnip.nodes.optional_arg")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = luasnip.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

-- local s = luasnip.snippet
-- local t = luasnip.text_node
-- local i = luasnip.insert_node
-- local extras = require("luasnip.extras")
-- local rep = extras.rep
-- local fmt = require("luasnip.extras.fmt").fmt
-- local c = luasnip.choice_node
-- local f = luasnip.function_node
-- local d = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

-- luasnip.add_snippets("lua", {
--     s("if", {
--         t('if '),
--         i(1, "true"),
--         t(' then '),
--         i(2),
--         t(' end')
--     })
-- })

-- luasnip.add_snippets("tex", {
--     s("beg", {
--         t("\\begin{"), i(1), t("}"),
--         t({ "", "\t" }), i(0),
--         t({ "", "\\end{" }), rep(1), t("}"),
--     })
-- })

-- luasnip.add_snippets("cs", {
--     s("logc",
--         fmt([[Debug.Log($"<color={}>{}</color>");]],
--         {
--             c(1, {
--                 t("red"),
--                 t("green"),
--                 t("blue"),
--                 t("cyan"),
--                 t("magenta")
--             }),
--             i(2),
--         })),
-- })

-- completion {{{2

-- cmp {{{3

local cmp = require('cmp')

cmp.setup {
	completion = {
		--autocomplete = false,
		--autocomplete = {},
		autocomplete = {
			require("cmp.types").cmp.TriggerEvent.TextChanged
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		--['<C-N>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			select = false,
			behavior = cmp.ConfirmBehavior.Replace,
		},
		['<m-j>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<m-k>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'buffer', keyword_length = 2 },
		{ name = ']', keyword_length = 2 },
		{ name = 'path', keyword_length = 3 },
		-- tags
		{ name = 'spell', keyword_length = 4 },
		-- for lsp
		{ name = 'nvim_lsp', keyword_length = 2 },
		-- for cmp-nvim-lsp-signature-help
		{ name = 'nvim_lsp_signature_help' },
		-- for luasnip
		{ name = 'luasnip', keyword_length = 3 },
	},
}

-- toggle {{{3

local cmp_enabled = true

vim.keymap.set('n', '<f11>c', function()
	cmp_enabled = not cmp_enabled
	if cmp_enabled then
		cmp.setup({ enabled = true, })
		--vim.opt.completeopt:append('noselect')
		--vim.opt.completeopt:remove('noselect')
	else
		cmp.abort()
		cmp.setup({ enabled = false, })
		--vim.opt.completeopt:append('noselect')
		--vim.opt.completeopt:remove('noselect')
		pcall(vim.keymap.del, 'i', '<C-n>')
		pcall(vim.keymap.del, 'i', '<C-p>')
		pcall(vim.keymap.del, 'i', '<C-x>')
		vim.keymap.set('i', '<tab>', function()
			return vim.fn['library#smart_tab']()
		end, { expr = true, replace_keycodes = true })
		vim.keymap.set('i', '<tab>', '<Plug>(organ-tab)', { remap = true })
		vim.keymap.set('i', '<s-tab>', function()
			return vim.fn['library#smart_shift_tab']()
		end, { expr = true, replace_keycodes = true })
		vim.keymap.set('i', '<s-tab>', '<Plug>(organ-shift-tab)', { remap = true })
		vim.keymap.set('i', '<c-tab>', '<C-x><C-o>', { remap = true })
	end
end, { desc = 'Toggle nvim-cmp' })

-- cmp-nvim-lsp {{{3

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
  capabilities = capabilities,
})

-- terminal {{{2

-- toggleterm {{{3

require("toggleterm").setup{
	size = 35,
	--size = 120,
	open_mapping = [[<C-=>]],
	--direction = 'horizontal',
	--direction = 'vertical',
	direction = 'float',
	start_in_insert = true,
	persist_size = true,
}

-- repl : read eval print loop {{{2

-- iron {{{3

require('iron.core').setup({
	config = {
		scratch_repl = true,
		repl_definition = {
			sh = { command = { 'sh' } },
			bash = { command = { 'bash' } },
			zsh = { command = { 'zsh' } },
			lua = { command = { 'lua' } },
			python = {
				command = { "ipython", "--no-autoindent" },
				block_dividers = { "# %%", "#%%" },
				env = { PYTHON_BASIC_REPL = "1" }
			},
		},
		repl_open_cmd = require('iron.view').split.vertical.botright(0.618),
	},
	keymaps = {
		toggle_repl = "<c-$>",
		send_line = "<c-cr>",
		--visual_send = "<c-cr>",
		--send_paragraph = "<s-cr>",
		--send_file = "<c-s-cr>",
		send_motion = "<c-m-cr>",
		send_code_block_and_move = "<f5>b",
		send_until_cursor = "<f5>c",
		send_code_block = "<f5>B",
		cr = "<f5><cr>",
		interrupt = "<f5>s",
		restart_repl = "<f5>r",
		exit = "<f5>q",
		clear = "<f5>-",
	},
	ignore_blank_lines = false,
})

local iron = require("iron.core")

vim.keymap.set("v", "<c-cr>", function()
  iron.visual_send()
  iron.send(nil, "\r")
end, { desc = "Send selection + CR" })

vim.keymap.set("n", "<s-cr>", function()
  local start = vim.fn.search("^\\s*$", "bnW") + 1
  local finish = vim.fn.search("^\\s*$", "nW") - 1
  if finish < start then
    finish = vim.fn.line("$")
  end
  local lines = vim.api.nvim_buf_get_lines(0, start - 1, finish, false)
  table.insert(lines, "\r")
  iron.send(nil, table.concat(lines, "\n"))
end, { desc = "Send paragraph + CR" })

vim.keymap.set("n", "<c-s-cr>", function()
  iron.send_file()
  iron.send(nil, "\r")
end, { desc = "Send file + CR" })

-- yarepl {{{3

-- local yarepl = require 'yarepl'

-- yarepl.setup {
-- 	wincmd = 'belowright 15 split',
-- 	close_on_exit = true,
-- 	scroll_to_bottom_after_sending = true,
-- 	highlight_on_send_operator = { enabled = false, hl_group = 'IncSearch', timeout = 150 },
-- 	metas = {
-- 		sh = { cmd = 'sh', formatter = 'bracketed_pasting', source_syntax = 'sh' },
-- 		bash = {
-- 			cmd = 'bash',
-- 			formatter = vim.fn.has 'linux' == 1 and 'bracketed_pasting' or 'trim_empty_lines',
-- 			source_syntax = 'bash',
-- 		},
-- 		zsh = { cmd = 'zsh', formatter = 'bracketed_pasting', source_syntax = 'zsh' },
-- 		lua = { cmd = 'lua', formatter = 'bracketed_pasting', source_syntax = 'lua' },
-- 		ipython = { cmd = 'builtin:ipython', formatter = 'bracketed_pasting', source_syntax = 'ipython' },
-- 		python = { cmd = 'builtin:python', formatter = 'trim_empty_lines', source_syntax = 'python' },
-- 	},
-- }
