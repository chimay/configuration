-- ~/.config/xplr/init.lua

version = "1.0.1"

-- plugins {{{1

-- paths {{{1

local home = os.getenv("HOME")
package.path = home
.. "/.config/xplr/plugin/?/init.lua;"
.. home
.. "/.config/xplr/plugin/?.lua;"
.. package.path

-- one table column {{{1

require("one-table-column").setup()

--require("one-table-column").setup({ index = true })

-- dual pane {{{2

require("dual-pane").setup {
  active_pane_width = { Percentage = 70 },
  inactive_pane_width = { Percentage = 30 },
}

-- tri pane {{{2

-- require("tri-pane").setup({
--   layout_key = "t", -- In switch_layout mode
--   as_default_layout = true,
--   left_pane_width = { Percentage = 20 },
--   middle_pane_width = { Percentage = 50 },
--   right_pane_width = { Percentage = 30 },
--   left_pane_renderer = custom_function_to_render_left_pane,
--   right_pane_renderer = custom_function_to_render_right_pane
-- })

-- treeview {{{2

-- require("tree-view").setup()

require("tree-view").setup({
    mode = "switch_layout",
    key = "§",
    -- If you feel slowness, you might want to toggle back to the default view.
    toggle_layout_mode = "default",
    toggle_layout_key = "§",
    -- Press backspace to close all and back and close
    close_all_and_back_mode = "default",
    close_all_and_back_key = "backspace",
    -- Toggle expansion without entering
    toggle_expansion_mode = "default",
    toggle_expansion_key = "o",
    -- Toggle expansion of all the nodes under pwd
    toggle_expansion_all_mode = "default",
    toggle_expansion_all_key = "O",
    -- Focus on the next visible line, not compatible with up/down action
    focus_next_mode = "default",
    focus_next_key = "]",
    -- Focus on the previous visible line, not compatible with up/down action
    focus_prev_mode = "default",
    focus_prev_key = "[",
    -- Go to the next deep level directory that's open
    goto_next_open_mode = "default",
    goto_next_open_key = ")",
    -- Go to the previous deep level directory that's open
    goto_prev_open_mode = "default",
    goto_prev_open_key = "(",
    -- Whether to display the tree in full screen
    fullscreen = false,
    -- Indent for the branches of the tree
    indent = "  ",
    -- Start xplr with tree view layout
    as_initial_layout = false,
    -- Disables toggling layout.
    as_default_layout = false,
    -- Automatically fallback to this layout for better performance if the
    -- branch contains # of nodes more than the threshold value
    fallback_layout = "Table",
    fallback_threshold = 500,  -- default: nil (disabled)
})

-- context switch {{{2

require("context-switch").setup()

-- type to nav {{{2

require("type-to-nav").setup({
  default_bindings = false,
})

local function merge_in(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
end

xplr.config.modes.builtin.default.key_bindings.on_key['n'] = {
  help = 'type-to-nav',
  messages = {
    { CallLuaSilently = 'custom.type_to_nav_start' },
  },
}

xplr.config.modes.builtin.default.key_bindings.on_key['N'] = {
  help = 'type-to-nav',
  messages = {
    { CallLuaSilently = 'custom.type_to_nav_start_selecting' },
  },
}

merge_in(xplr.config.modes.custom.type_to_nav.key_bindings.on_key, {
  esc = {
    help = 'quit mode',
    messages = { { CallLuaSilently = 'custom.type_to_nav_quit' } },
  },
  ['ctrl-u'] = {
    help = 'clear input',
    messages = { { CallLuaSilently = 'custom.type_to_nav_clear_input' } },
  },
  ['ctrl-v'] = {
    help = 'toggle selecting',
    messages = { { CallLuaSilently = 'custom.type_to_nav_toggle_selecting' } },
  },
  ['ctrl-h'] = {
    help = 'up',
    messages = { { CallLuaSilently = 'custom.type_to_nav_up' } },
  },
  backspace = {
    help = 'remove last characters',
    messages = {
      { CallLuaSilently = 'custom.type_to_nav_back' },
    },
  },
  enter = {
    help = 'accept',
    messages = { { CallLuaSilently = 'custom.type_to_nav_accept' } },
  },
  ['ctrl-p'] = { help = 'focus previous', messages = { 'FocusPrevious' } },
  ['ctrl-n'] = { help = 'focus next', messages = { 'FocusNext' } },
  ['ctrl-s'] = { help = 'toggle select', messages = { 'ToggleSelection' } },
  ['ctrl-a'] = {
    help = 'toggle select all',
    messages = { 'ToggleSelectAll' },
  },
})

-- fzf {{{2

require("fzf").setup{
  mode = "default",
  --key = "ctrl-f",
  key = "z",
  bin = "fzf",
  args = "--preview 'pistol {}'",
  recursive = true,  -- If true, search all files under $PWD
  enter_dir = true,  -- Enter if the result is directory
}

-- zoxide {{{2

-- Type `Z` to spawn zoxide prompt.
-- Press `ctrl-f` to spawn fzf in $PWD

require("zoxide").setup{
  key = "Z",
  mode = "default",
  bin = "zoxide",
}

-- xclip {{{2

-- require("xclip").setup{
--   copy_command = "xclip-copyfile",
--   copy_paths_command = "xclip -sel clip",
--   paste_command = "xclip-pastefile",
--   keep_selection = false,
-- }

-- wl clipboard {{{2

-- Type `yy` to copy and `p` to paste files.

require("wl-clipboard").setup{
  copy_command = "wl-copy -t text/uri-list",
  paste_command = "wl-paste",
  keep_selection = false,
}

-- map {{{2

-- Type `M` to switch to single map mode.
-- Then press `tab` to switch between single and multi map modes.
-- Press `ctrl-o` to edit the command using your editor.

local map = require("map")
map.setup{
  mode = "default",  -- or `xplr.config.modes.builtin.default`
  key = "M",
  editor = os.getenv("EDITOR") or "vim",
  editor_key = "ctrl-o",
  prefer_multi_map = false,
  placeholder = "{}",
  spacer = "{_}",
  custom_placeholders = map.placeholders,
}

-- trash cli {{{2

-- Type `dd` to trash, `dr` or `dR` to restore, and `dE` to empty trash.

require("trash-cli").setup{
  -- Trash file(s)
  trash_bin = "trash-put",
  trash_mode = "delete",
  trash_key = "d",
  -- Empty trash
  empty_bin = "trash-empty",
  empty_mode = "delete",
  empty_key = "E",
  -- Interactive selector
  trash_list_bin = "trash-list",
  trash_list_selector = "fzf -m | cut -d' ' -f3-",
  -- Restore file(s)
  restore_bin = "trash-restore",
  -- Restore files deleted from $PWD only
  restore_mode = "delete",
  restore_key = "r",
  -- Restore files deleted globally
  global_restore_mode = "delete",
  global_restore_key = "R",
}

-- material landscape {{{2

-- require("material-landscape2").setup{
--   keep_default_layout = true
-- }

-- theme {{{1

xplr.config.node_types.directory.style = {
  fg = "Reset",
}

xplr.config.general.focus_ui = {
  style = {
    fg = "Yellow",
    bg = "Black",
    add_modifiers = {},
  },
}
