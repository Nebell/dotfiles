-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'OneHalfDark'

-- font
config.font_size = 13
config.font = wezterm.font_with_fallback({
    'Hack Nerd Font Mono',
    'CaskaydiaCove NF',
    'Noto Sans CJK SC',
    'WenQuanYi Zen Hei',
    'WenQuanYi Micro Hei',
    'Noto Color Emoji',
})

-- appearance
config.line_height = 1.1
config.initial_cols, config.initial_rows = 100, 27
config.colors = {
    -- background = '#282c34'
    scrollbar_thumb = '#2e2e2e',
}

-- tarbar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 64

-- scroll
config.enable_scroll_bar = true
config.scrollback_lines = 100000
config.scroll_to_bottom_on_input = true

-- ime
config.use_ime = true
config.xim_im_name = "fcitx"

-- keys
local act = wezterm.action

config.keys = {
  { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
  { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
  { key = 'PageUp', mods = 'CTRL', action = act.ScrollByLine(-3) },
  { key = 'PageDown', mods = 'CTRL', action = act.ScrollByLine(3) },
}

-- and finally, return the configuration to wezterm
return config
