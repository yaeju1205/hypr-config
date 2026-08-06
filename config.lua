local general = {
    gaps_in  = 5,
    gaps_out = 5,

    border_size = 2,

    col = {
        active_border   = "#C58EA7",
        inactive_border = "#665B66",
    },

    resize_on_border = false,
    allow_tearing = false,
    no_focus_fallback = true,

    layout = "scrolling",
}

local decoration = {
    rounding       = 5,
    rounding_power = 2,

    active_opacity   = 1.0,
    inactive_opacity = 0.95,

    shadow = {
        enabled      = true,
        range        = 4,
        render_power = 3,
        color        = 0x070707,
    },

    blur = {
        enabled   = true,
        size      = 3,
        passes    = 1,
        vibrancy  = 0.1696,
    },
}

local binds = {
    scroll_event_delay = 150,
    drag_threshold = 10,
    window_direction_monitor_fallback = false,
}

local cursor = {
    enable_hyprcursor = false,
}

local input = {
    repeat_rate = 50,
    repeat_delay = 300,

    kb_layout = "us",
    kb_variant = "",

    follow_mouse = 0,
    sensitivity = 0,
}

local misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo   = false,
    mouse_move_focuses_monitor = false,
    focus_on_activate = true,
}

local scrolling = {
    fullscreen_on_one_column = true,
    column_width = 1,
    explicit_column_widths = "0.25, 0.5, 1",
    focus_fit_method = true,
    follow_focus = true,
}

local plugin = {}

hl.config({
    general = general,
    decoration = decoration,
    binds = binds,
    cursor = cursor,
    input = input,
    misc = misc,
    scrolling = scrolling,
    plugin = plugin,
    animations = {
        enabled = true
    },
})
