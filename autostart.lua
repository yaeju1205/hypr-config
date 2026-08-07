hl.exec_cmd("wl-paste --type text --watch cliphist store")
hl.exec_cmd("wl-paste --type image --watch cliphist store")

hl.exec_cmd("kime-wayland")

hl.exec_cmd("hyprpaper")
hl.exec_cmd("quickshell")

local monitors = require("./monitors")

for i=1, #monitors do
    local monitor = monitors[i]

    hl.dispatch(hl.dsp.focus({
        workspace = i * 10,
        monitor = monitor,
    }))
end
