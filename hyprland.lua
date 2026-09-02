-- Set monitors
require("./monitors")

-- Hyprland main config
require("./config")

-- Hyprland animation
require("./animation")

-- Hyprland gesture
require("./gesture")

-- Hyprland key bindings
require("./binds")

-- Hyprland window rules
require("./rules")

-- Hyprland auto start
hl.on("hyprland.start", function()
    require("./autostart")
end)
