-- vim: set filetype=lua:

require('config.functions')
require('config.commands')
require('config.options')
require('config.autocmds')
require('config.keybinds')
require('config.interface')
require('config.treesitter')
require('config.lsp')

require('plugin.native')
require('plugin.rocks')

--do
	--return
--end

-- lots of issues
-- not recommended with other plugin managers
--require('plugin.lazy')
