-- vim: set filetype=lua:

-- rocks {{{1

local rocks_config = {
	rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
	vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
	vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}

package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
	vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
	vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
	-- Remove the dylib and dll paths if you do not need macos or windows support
	vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
	vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
	vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
	vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))

-- neorg {{{1

require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					plain = "~/racine/plain/neorg",
				},
				default_workspace = "plain",
			},
		},
	}
})

-- math-conceal {{{1

-- require("math-conceal").setup({
--     ft = {
--         "plaintex",
--         "tex",
--         "context",
--         "bibtex",
--         "markdown",
--         "typst",
--     },
--     conceal = {
--         "greek",
--         "script",
--         "math",
--         "font",
--         "delim",
--         "phy",
--     },
--     opt = {
--         conceallevel = 2,
--         concealcursor = "n",
--     },
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "org",
--     callback = function(args)
--         require("math-conceal").attach(args.buf, {
--             source = {
--                 kind = "markdown",
--                 filetype = "org",
--                 path = vim.api.nvim_buf_get_name(args.buf),
--             },
--             surfaces = {
--                 unicode = true,
--                 image = false,
--             },
--             mode = "edit",
--         })
--     end,
-- })
