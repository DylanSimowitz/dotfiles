local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local icons = require("icons")
icons.init("sheet")

local active_color = {
    type = 'linear',
    from = {0, 0},
    to = {200, 50}, -- replace with w,h later
    stops = {{0, beautiful.xcolor6}, {0.75, beautiful.xcolor4}}
}

local icon = {
    id = "icon",
    image = icons.brightness,
    resize = true,
    widget = wibox.widget.imagebox
}

local brightness_arc = wibox.widget {
    icon,
    max_value = 100,
    thickness = 8,
    start_angle = 4.71238898, -- 2pi*3/4
    forced_height = 100,
    rounded_edge = true,
    forced_width = 100,
    bg = beautiful.xcolor0,
    paddings = 10,
    colors = {active_color},
    widget = wibox.container.arcchart
}

awesome.connect_signal("ears::brightness",
                       function(value) brightness_arc.value = value end)

return brightness_arc
