-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'OneHalfDark'
-- config.color_scheme = 'Apprentice (Gogh)'

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
}

-- tarbar
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false

-- scroll
config.scrollback_lines = 100000

-- and finally, return the configuration to wezterm
return config
