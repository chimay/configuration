-- vim: set filetype=lua:

require('config.functions')
require('config.commands')
require('config.options')
require('config.autocmds')
require('config.keybinds')
-- require('config.nvim_ui')

require('plugin.native')
require('plugin.rocks')

--do
	--return
--end

-- lots of issues
-- not recommended with other plugin managers
--require('plugin.lazy')
