
-- start hyprland with start-hyprland

-- https://wiki.hypr.land/Configuring/Start/

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

-- helpers {{{1

local function notify(text)
    hl.notification.create({
        text = text,
        timeout = 30000,
        icon = "info",
        color = "rgba(5b3c11ff)",
    })
end

-- environment variables {{{1

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- permissions {{{1

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-- monitors, screens {{{1

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output   = "",
	mode     = "preferred",
	position = "auto",
	scale    = "auto",
})

-- idle {{{2

hypridle = {
	listener = {
		timeout = 600,
		on_timeout = function()
			hl.dpms.off()
		end,
		on_resume = function()
			hl.dpms.on()
		end,
	},
}

-- input : keyboard, mouse, touchpad {{{1

hl.config({
	input = {
		--kb_layout  = "be",
		kb_layout  = "belge-meta-super-hyper",
		kb_variant = "",
		kb_model   = "",
		kb_options = "",
		kb_rules   = "",
		numlock_by_default = true,
		follow_mouse = 0,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		touchpad = {
			tap_to_click = true,
			tap_button_map = "lrm",
			tap_and_drag = true,
			natural_scroll = false,
			scroll_factor = 1,
			disable_while_typing = true,
		},
	},
	cursor = {
		hide_on_key_press = true,
		inactive_timeout = 5,
	},
})

-- hl.gesture({
-- 	fingers = 3,
-- 	direction = "horizontal",
-- 	action = "workspace"
-- })

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more

-- hl.device({
--     name        = "epic-mouse-v1",
--     sensitivity = -0.5,
-- })

-- autostart {{{1

-- opening {{{2

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function ()

-- bars {{{2

	--hl.exec_cmd("waybar & ")

-- gui shells {{{2

---- bar, wallpaper, login, power, etc

	hl.exec_cmd("dms run ; sleep 2")

	--hl.exec_cmd("noctalia & ")

-- autostart script {{{2

-- neede in one exec because executed asynchronously

hl.exec_cmd("hypr-autostop.zsh >>! ~/log/hypr-autostop.log 2>&1 ; sleep 2 ; hypr-autostart.zsh >>! ~/log/hypr-autostart.log 2>&1")

-- closing {{{2

end)

-- look and feel {{{1

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	general = {
		gaps_in  = 5,
		gaps_out = 20,
		border_size = 2,
		col = {
			active_border   = { colors = {"rgba(9b3c11ee)", "rgba(7b3c11ee)"}, angle = 45 },
			--inactive_border = "rgba(595959aa)",
			inactive_border = "rgba(000000aa)",
		},
		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,
		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,
		layout = "master",
		--layout = "scrolling",
	},
	decoration = {
		rounding       = 10,
		rounding_power = 2,
		-- Change transparency of focused and unfocused windows
		active_opacity   = 1.0,
		inactive_opacity = 0.7,
		shadow = {
			enabled      = true,
			range        = 4,
			render_power = 3,
			color        = 0xee1a1a1a,
		},
		blur = {
			enabled   = true,
			size      = 3,
			passes    = 1,
			vibrancy  = 0.1696,
		},
	},
	animations = {
		enabled = false,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs

hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

-- hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
-- hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
-- hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
-- hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
-- hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
-- hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
-- hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
-- hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
-- hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
-- hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.

-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })

-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

hl.config({
	master = {
		orientation = "top",
		mfact = 0.618,
	},
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

hl.config({
    scrolling = {
		direction = "left",
		-- 1 - golden_ratio^3
        column_width = 0.764,
        --explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more

hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

-- rules {{{1

-- windows {{{2

hl.window_rule({
    match = {
        title = "zshrun",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "zshrunterm",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "journal",
    },
    float = true,
})

hl.window_rule({
	match = {
		class = "kitty-dropdown",
	},
	float = true,
	size = "1200 600",
	move = "300 70",
})

hl.window_rule({
	match = {
		class = "calc",
	},
	float = true,
	size = "1200 600",
	move = "300 70",
})

-- workspaces names {{{2

hl.workspace_rule({ workspace = "1", default_name = "term"})
hl.workspace_rule({ workspace = "2", default_name = "view"})
hl.workspace_rule({ workspace = "3", default_name = "edit"})
hl.workspace_rule({ workspace = "4", default_name = "system"})
hl.workspace_rule({ workspace = "5", default_name = "browser"})
hl.workspace_rule({ workspace = "6", default_name = "office"})
hl.workspace_rule({ workspace = "7", default_name = "artisan"})
hl.workspace_rule({ workspace = "8", default_name = "video"})
hl.workspace_rule({ workspace = "9", default_name = "game"})

-- workspaces layouts {{{2

hl.workspace_rule({
    workspace = "name:view",
    layout = "scrolling",
})

hl.workspace_rule({
    workspace = "name:browser",
    layout = "scrolling",
})

hl.workspace_rule({
    workspace = "name:video",
    layout = "scrolling",
})

hl.workspace_rule({
    workspace = "special:magic",
    layout = "monocle",
})

-- windows and workspaces {{{2

-- term {{{3

-- view {{{3

hl.window_rule({
    match = {
        class = "sioyek",
    },
    --workspace = "name:view",
    workspace = "2",
})

hl.window_rule({
    match = {
        class = "org.pwmt.zathura",
    },
    workspace = "2",
})

hl.window_rule({
    match = {
        class = "Sxiv",
    },
    workspace = "2",
})

hl.window_rule({
    match = {
        class = "vimiv",
    },
    workspace = "2",
})

hl.window_rule({
    match = {
        class = "org.kde.gwenview",
    },
    workspace = "2",
})

-- edit {{{3

hl.window_rule({
    match = {
        class = "nvim-qt",
    },
    workspace = "3",
})

-- system {{{3

hl.window_rule({
    match = {
        class = "TradingView",
    },
    workspace = "4",
})

-- browser {{{3

hl.window_rule({
    match = {
        class = "org.qutebrowser.qutebrowser",
    },
    workspace = "5",
})

hl.window_rule({
    match = {
		class = "firefox",
    },
    workspace = "5",
})

-- office {{{3

hl.window_rule({
    match = {
        class = "libreoffice-startcenter",
    },
    workspace = "6",
})

-- artisan {{{3

hl.window_rule({
    match = {
        class = "org.frescobaldi.Frescobaldi",
    },
    workspace = "7",
})

hl.window_rule({
    match = {
        class = "MuseScore4",
    },
    workspace = "7",
})

-- video {{{3

hl.window_rule({
    match = {
        class = "vlc",
    },
    workspace = "8",
})

hl.window_rule({
    match = {
        class = "freetube",
    },
    workspace = "8",
})

-- game {{{3

hl.window_rule({
    match = {
        class = "wesnoth",
    },
    workspace = "9",
})

hl.window_rule({
    match = {
        class = "freeciv-gtk3.22",
    },
    workspace = "9",
})

-- miscellaneous {{{4

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name  = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name  = "fix-xwayland-drags",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},
	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name  = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move  = "20 monitor_h-120",
	float = true,
})

-- keybindings {{{1

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- modifiers {{{2

--local super = "SUPER"

local meta = "MOD1"
local super = "MOD4"
local hyper = "MOD3"

--local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local mainMod = hyper -- Sets "mod3 = hyper = right windows key with meta-super-hyper layout" key as main modifier

-- help {{{2

hl.bind(hyper .. " + F1", hl.dsp.exec_cmd("dms ipc call hypr toggleBinds"))
hl.bind(hyper .. " + h", hl.dsp.exec_cmd("dms ipc call hypr toggleBinds"))

-- terminal {{{2

hl.bind(hyper .. " + Return", hl.dsp.exec_cmd("kitty --single-instance"))

hl.bind(hyper .. " + dollar", hl.dsp.exec_cmd([[
kitty --single-instance --class kitty-dropdown
]]))

-- hl.bind(hyper .. " + dollar", hl.dsp.exec_cmd([[
-- kitty --single-instance \
-- --class kitty-dropdown \
-- -o remember_window_size=no \
-- -o initial_window_width=120c \
-- -o initial_window_height=30c
-- ]]))

hl.bind(hyper .. " + exclam", hl.dsp.exec_cmd("urxvtc"))

local closeWindowBind = hl.bind(hyper .. " + SHIFT + X", hl.dsp.window.close())
local closeWindowBind = hl.bind(hyper .. " + Delete", hl.dsp.window.close())

-- launchers {{{2

hl.bind(hyper .. " + equal", hl.dsp.exec_cmd("dms ipc call launcher toggle"))

--hl.bind(hyper .. " + colon", hl.dsp.exec_cmd("hyprlauncher"))
--hl.bind(hyper .. " + colon", hl.dsp.exec_cmd("fuzzel"))

hl.bind(super .. " + colon", hl.dsp.exec_cmd("zshrun.sh"))
hl.bind(super .. " + semicolon", hl.dsp.exec_cmd("zshrunterm.sh"))

-- hyprland {{{2

hl.bind(hyper .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

-- windows {{{3

-- Move focus with mainMod + arrow keys

hl.bind(super .. " + prior",  function ()
	hl.dispatch(hl.dsp.layout("cyclenext"))
	hl.dispatch(hl.dsp.window.move({ direction = "down"}))
end)

hl.bind(super .. " + next",  function ()
	hl.dispatch(hl.dsp.layout("cycleprev"))
	hl.dispatch(hl.dsp.window.move({ direction = "up"}))
end)

-- hl.bind(super .. " + prior", hl.dsp.layout("cyclenext"))
-- hl.bind(super .. " + next",  hl.dsp.layout("cycleprev"))

hl.bind(super .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(super .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(super .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(super .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(super .. "+ SHIFT + left", hl.dsp.window.move({ direction = "left"}))
hl.bind(super .. "+ SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(super .. "+ SHIFT + up", hl.dsp.window.move({ direction = "up"}))
hl.bind(super .. "+ SHIFT + down", hl.dsp.window.move({ direction = "down"}))

hl.bind(super .. "+ CONTROL + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
hl.bind(super .. "+ CONTROL + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
hl.bind(super .. "+ CONTROL + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
hl.bind(super .. "+ CONTROL + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })

--hl.bind(super .. "+ CONTROL + r", hl.dsp.submap("resize"))

--hl.define_submap("resize", function()
	--hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
	--hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
	--hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
	--hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
	--hl.bind("escape", hl.dsp.submap("reset"))
--end)

-- Keybinds further down will be global again...

-- closeWindowBind:set_enabled(false)

hl.bind(hyper .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(hyper .. " + M", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(hyper .. " + P", hl.dsp.window.pseudo())

-- windows and workspaces overview

--hl.bind(hyper .. " + comma", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))

hl.bind(hyper .. " + comma", hl.dsp.exec_cmd("rofi-windows.zsh"))

-- layout {{{3

local function set_layout(layout)
	local workspace = hl.get_active_special_workspace()
		or hl.get_active_workspace()
	if not workspace then
		return
	end
	if workspace.special then
		hl.workspace_rule({
			workspace = tostring(workspace.name),
			layout = layout,
		})
	else
		hl.workspace_rule({
			workspace = "name:" .. tostring(workspace.name),
			layout = layout,
		})
	end
end

hl.bind("MOD3 + tab", function()
	local workspace = hl.get_active_special_workspace()
	or hl.get_active_workspace()
	if not workspace then
		return
	end
	local layout = workspace.tiled_layout
	if layout == "monocle" then
		hl.workspace_rule({
			workspace = "name:" .. tostring(workspace.name),
			layout = "master",
		})
	else
		hl.workspace_rule({
			workspace = "name:" .. tostring(workspace.name),
			layout = "monocle",
		})
	end
end)

-- Super-l
--     │
--     ├── m → master mode
--     │       ├── h → orientation left
--     │       ├── j → orientation bottom
--     │       ├── k → orientation top
--     │       ├── l → orientation right
--     │       ├── n → next master
--     │       ├── p → previous master
--     │       └── Esc
--     │
--     ├── d → dwindle mode
--     │       ├── v → toggle split
--     │       ├── x → swap split
--     │       └── Esc
--     │
--     ├── s → scrolling mode
--     │       ├── h → swap column left
--     │       ├── l → swap column right
--     │       ├── p → promote
--     │       ├── h/l → move layout
--     │       └── Esc
--     │
--     └── Esc

hl.bind(hyper .. " + l", hl.dsp.submap("layout"))

hl.define_submap("layout", function()
	hl.bind("m", function()
		set_layout("master")
		notify("Master: ← → ↑ ↓ orientation, n next, p previous")
		hl.dispatch(hl.dsp.submap("master"))
	end)
	hl.bind("t", function()
		set_layout("monocle")
		notify("Tabbed, monocle : n next, p previous")
		hl.dispatch(hl.dsp.submap("tabbed"))
	end)
	hl.bind("d", function()
		set_layout("dwindle")
		notify("Dwindle: t toggle split, x swap split")
		hl.dispatch(hl.dsp.submap("dwindle"))
	end)
	hl.bind("s", function()
		set_layout("scrolling")
		notify("Scrolling: ← → move column, h swap left, l swap right, p promote")
		hl.dispatch(hl.dsp.submap("scrolling"))
	end)
	hl.bind("g", function()
		notify("n next, p previous, f forward, b backward")
		hl.dispatch(hl.dsp.group.toggle())
		hl.dispatch(hl.dsp.submap("group"))
	end)
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.define_submap("master", function()
	hl.bind("left", hl.dsp.layout("orientationleft"))
	hl.bind("right", hl.dsp.layout("orientationright"))
	hl.bind("up", hl.dsp.layout("orientationtop"))
	hl.bind("down", hl.dsp.layout("orientationbottom"))
	hl.bind("n", hl.dsp.layout("cyclenext"))
	hl.bind("p", hl.dsp.layout("cycleprev"))
	hl.bind("m", hl.dsp.layout("swapwithmaster master"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.define_submap("tabbed", function()
    hl.bind("n", hl.dsp.layout("cyclenext"))
    hl.bind("p", hl.dsp.layout("cycleprev"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.define_submap("dwindle", function()
	hl.bind("t", hl.dsp.layout("togglesplit"))
	hl.bind("x", hl.dsp.layout("swapsplit"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.define_submap("scrolling", function()
	hl.bind("left", hl.dsp.layout("move -col"))
	hl.bind("right", hl.dsp.layout("move +col"))
	hl.bind("h", hl.dsp.layout("swapcol l"))
	hl.bind("l", hl.dsp.layout("swapcol r"))
	hl.bind("p", hl.dsp.layout("promote"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.define_submap("group", function()
	hl.bind("n", hl.dsp.group.next())
	hl.bind("p", hl.dsp.group.prev())
	hl.bind("f", hl.dsp.group.move_window({ forward = false }))
	hl.bind("b", hl.dsp.group.move_window({ forward = true }))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

--hl.bind(hyper .. " + g", hl.dsp.layout("mfact exact 0.618"))

-- workspaces {{{3

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]

for i = 1, 9 do
	-- local key = i % 10 -- 10 maps to key 0
	key = i
	hl.bind(super .. " + F" .. key,             hl.dsp.focus({ workspace = i}))
	hl.bind(super .. " + SHIFT + F" .. key,     hl.dsp.window.move({ workspace = i }))
end

-- x+n or x-n ; n = integer
-- e	Look on all monitors
-- m	Look on current monitor
-- r	Look on current monitor, including empty/nonexistent workspaces	[1 - …]

hl.bind(hyper .. " + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(hyper .. " + left",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(hyper .. " + next", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(hyper .. " + prior",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(hyper .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(hyper .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(super .. " + Tab", hl.dsp.focus({ workspace = "previous" }))
hl.bind(hyper .. " + asciicircum", hl.dsp.focus({ workspace = "previous" }))

-- scratchpad {{{3

-- Example special workspace (scratchpad)

hl.bind("SHIFT + F12",         hl.dsp.workspace.toggle_special("magic"))

--hl.bind("CONTROL + SHIFT + F12", hl.dsp.window.move({ workspace = "special:magic" }))

-- quit {{{3

hl.bind(hyper .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(hyper .. " + K", hl.dsp.exec_cmd("hyprlock"))

-- dms {{{2

-- see dms ipc list

hl.bind(hyper .. " + D", hl.dsp.exec_cmd("dms ipc call settings toggle"))
hl.bind(hyper .. " + SHIFT + D", hl.dsp.exec_cmd("dms ipc call settings toggleWith dankbar_widgets"))

hl.bind(hyper .. " + B", function()
	hl.dispatch(hl.dsp.exec_cmd("dms ipc call bar toggle index 0"))
	hl.dispatch(hl.dsp.exec_cmd("dms ipc call bar toggle index 1"))
end)

hl.bind(hyper .. " + C", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(hyper .. " + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))

hl.bind(hyper .. " + Q", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))

-- send a notification
-- dms ipc call toast info "Hello from Hyprland"
-- dms ipc call toast warn "Disk space low"
-- dms ipc call toast error "Something failed"

-- applications {{{2

hl.bind(hyper .. "+ A", hl.dsp.submap("applications"))

hl.define_submap("applications", function()
	hl.bind("A", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hypr-run-favorites.zsh"))
	end)
	hl.bind("section", hl.dsp.exec_cmd("run-vifm.zsh"))
	hl.bind("F", hl.dsp.exec_cmd("thunar || caja || pcmanfm"))
	hl.bind("N", hl.dsp.exec_cmd("run-neovim-server.sh & sleep 2 ; run-neovim-qt-client.sh"))
	hl.bind("SHIFT + N", hl.dsp.exec_cmd("neovim-qt-lite.sh"))
	hl.bind("G", hl.dsp.exec_cmd("run-gvim.sh"))
	hl.bind("SHIFT + G", hl.dsp.exec_cmd("gvim-lite.sh"))
	hl.bind("SHIFT + E", hl.dsp.exec_cmd("run-emacs-server.sh"))
	hl.bind("E", hl.dsp.exec_cmd("run-emacs-client.sh"))
	hl.bind("I", hl.dsp.exec_cmd("gwenview ~"))
	hl.bind("SHIFT + I", hl.dsp.exec_cmd("vimiv ~/photo/numerique"))
	hl.bind("equal", hl.dsp.exec_cmd("kitty --single-instance --name calc calc"))
	hl.bind("Q", hl.dsp.exec_cmd("qutebrowser"))
	hl.bind("SHIFT + O", hl.dsp.exec_cmd("torbrowser-launcher"))
	hl.bind("W", hl.dsp.exec_cmd("goto-or-run-appimage.sh vieb"))
	hl.bind("Z", hl.dsp.exec_cmd("goto-or-run-appimage.sh zen-browser"))
	hl.bind("K", hl.dsp.exec_cmd("keepassxc"))
	hl.bind("O", hl.dsp.exec_cmd("octave --gui"))
	hl.bind("T", hl.dsp.exec_cmd("tradingview"))
	hl.bind("Y", hl.dsp.exec_cmd("run-freetube.sh"))
	hl.bind("M", hl.dsp.exec_cmd("vlc"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- favorites {{{3

hl.bind(super .. " + CONTROL + A", hl.dsp.exec_cmd("hypr-run-favorites.zsh"))

hl.bind(super .. " + CONTROL + section", hl.dsp.exec_cmd("run-vifm.zsh"))

hl.bind(super .. " + CONTROL + equal", hl.dsp.exec_cmd([[
kitty --single-instance --class calc calc
]]))

hl.bind(super .. " + CONTROL + F", hl.dsp.exec_cmd("thunar || caja || pcmanfm"))
hl.bind(super .. " + CONTROL + I", hl.dsp.exec_cmd("gwenview"))
hl.bind(super .. " + CONTROL + N", hl.dsp.exec_cmd("run-neovim-server.sh & sleep 2 ; run-neovim-qt-client.sh"))
hl.bind(super .. " + CONTROL + T", hl.dsp.exec_cmd("tradingview"))
hl.bind(super .. " + CONTROL + Q", hl.dsp.exec_cmd("goto-or-run.sh qutebrowser"))
hl.bind(super .. " + CONTROL + B", hl.dsp.exec_cmd("floorp"))
hl.bind(super .. " + CONTROL + Y", hl.dsp.exec_cmd("run-freetube.sh"))

-- screen {{{2

hl.bind(hyper .. "+ s", hl.dsp.submap("screen"))

hl.define_submap("screen", function()
	hl.bind("s", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("screenshot.sh &> ~/log/screenshot.log"))
	end)
	hl.bind("0", hl.dsp.exec_cmd("brightnessctl set 100%"))
	hl.bind("up", hl.dsp.exec_cmd("brightnessctl set +10%"))
	hl.bind("down", hl.dsp.exec_cmd("brightnessctl set 10%-"))
	hl.bind("right", hl.dsp.exec_cmd("brightnessctl set +25%"))
	hl.bind("left", hl.dsp.exec_cmd("brightnessctl set 25%-"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- wallpaper {{{2

hl.bind(hyper .. "+ w", hl.dsp.submap("wallpaper"))

hl.define_submap("wallpaper", function()
	hl.bind("l", hl.dsp.exec_cmd("less-log.sh ~/log/wallpaper.log"))
	hl.bind("e", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("eval-wallpaper.zsh"))
	end)
	hl.bind("r", hl.dsp.exec_cmd("pkill -10 -f wallpaper.zsh"))
	hl.bind("n", hl.dsp.exec_cmd("pkill -12 -f wallpaper.zsh"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- notifications {{{2

-- hl.bind(super .. " + F11", hl.dsp.exec_cmd("dunstctl history-pop"))
-- hl.bind(super .. " + F12", hl.dsp.exec_cmd("dunstctl close-all"))

hl.bind(super .. " + F11", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(super .. " + F12", hl.dsp.exec_cmd("dms ipc call notifications clearAll"))

-- clipboard {{{2

hl.bind(hyper .. " + ccedilla", hl.dsp.exec_cmd("rofi-cliphist.sh"))

-- pass {{{2

hl.bind(hyper .. "+ y", hl.dsp.submap("pass"))

hl.define_submap("pass", function()
	hl.bind("plus", hl.dsp.exec_cmd("pass-open.sh"))
	hl.bind("equal", hl.dsp.exec_cmd("pass-open.sh"))
	hl.bind("minus", hl.dsp.exec_cmd("pass-close.sh"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(hyper .. " + X", hl.dsp.exec_cmd("passmenu.bash"))

-- keyboard {{{2

-- mouse {{{2

-- Scroll through existing workspaces with mainMod + scroll

hl.bind(hyper .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(hyper .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging

hl.bind(hyper .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(hyper .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- multimedia {{{2

-- mpc {{{3

hl.bind(hyper .. "+ SPACE", hl.dsp.submap("mpc"))

hl.define_submap("mpc", function()
	hl.bind("space", hl.dsp.exec_cmd("mpc toggle"))
	hl.bind("N", hl.dsp.exec_cmd("mpc next"))
	hl.bind("P", hl.dsp.exec_cmd("mpc prev"))
	hl.bind("backspace", hl.dsp.exec_cmd("mpc -q seek 0:0"))
	hl.bind("F", hl.dsp.exec_cmd("mpc seek +1:00"))
	hl.bind("B", hl.dsp.exec_cmd("mpc seek -1:00"))
	hl.bind("V", hl.dsp.exec_cmd("pavucontrol-qt"))
	hl.bind("T", hl.dsp.exec_cmd("urxvtc -name multimedia -e ncmpcpp"))
	hl.bind("E", hl.dsp.exec_cmd("eval-song.zsh"))
	hl.bind("up", hl.dsp.exec_cmd("pamixer --increase 5"))
	hl.bind("down", hl.dsp.exec_cmd("pamixer --decrease 5"))
	hl.bind("right", hl.dsp.exec_cmd("pamixer --increase 10"))
	hl.bind("left", hl.dsp.exec_cmd("pamixer --decrease 10"))
	hl.bind("prior", hl.dsp.exec_cmd("pamixer --increase 10"))
	hl.bind("next", hl.dsp.exec_cmd("pamixer --decrease 10"))
	hl.bind("M", hl.dsp.exec_cmd("urxvtc -name multimedia -e pulsemixer"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Laptop multimedia keys for volume and LCD brightness

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- misc {{{1

hl.config({
	misc = {
		force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
		},
	debug = {
		disable_logs = false,
	},
})

-- dms : dankmaterialshell {{{1

require("dms.colors")
require("dms.layout")
require("dms.outputs")
