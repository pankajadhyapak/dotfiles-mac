-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.color_scheme = "Catppuccin Mocha (Gogh)"

config.line_height = 1.6
local act = wezterm.action

config.keys = {
    {
        key = "r",
        mods = "CMD",
        action = act.ClearScrollback "ScrollbackAndViewport"
    },
    {
        key = "n",
        mods = "CMD",
        action = act.Multiple {
            act.SendKey {key = "b", mods = "CTRL"},
            act.SendKey {key = "%"}
        }
    },
    {
        key = "t",
        mods = "CMD",
        action = act.Multiple {
            act.SendKey {key = "b", mods = "CTRL"},
            act.SendKey {key = "c"}
        }
    },
    {
        key = "x",
        mods = "CMD",
        action = act.Multiple {
            act.SendKey {key = "b", mods = "CTRL"},
            act.SendKey {key = "x"}
        }
    }
}

return config
