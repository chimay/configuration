
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- options {{{1

config.font = wezterm.font('JetBrains Mono', {
    weight = 'Regular',
})
config.font_size = 12.0

config.line_height = 1.2
config.enable_tab_bar = false
config.window_background_opacity = 1.0
config.enable_tab_bar = true
config.skip_close_confirmation_for_processes_named = {}
config.window_close_confirmation = 'NeverPrompt'

-- keybindings {{{1

config.keys = {
	{
		key = 't',
		mods = 'SUPER',
		action = wezterm.action.SpawnTab 'CurrentPaneDomain',
	},
	{
		key = 'h',
		mods = 'SUPER',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
	{
		key = 'v',
		mods = 'SUPER',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	},
}

-- theme {{{1

config.colors = {
	foreground = '#5b3c11',
	background = '#000000',
	cursor_bg = '#5b3c11',
	cursor_fg = '#000000',
	cursor_border = '#5b3c11',
	tab_bar = {
		background = '#000000',
		active_tab = {
			fg_color = '#5b3c11',
			bg_color = '#000000',
		},
		inactive_tab = {
			fg_color = '#1a1a1a',
			bg_color = '#5b3c11',
		},
		inactive_tab_hover = {
			fg_color = '#333333',
			bg_color = '#5b3c11',
		},
		new_tab = {
			fg_color = '#000000',
			bg_color = '#5b3c11',
		},
		new_tab_hover = {
			fg_color = '#333333',
			bg_color = '#5b3c11',
		},
	},
}

-- return {{{1

return config

