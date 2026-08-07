hl.exec_cmd("wl-paste --type text --watch cliphist store")
hl.exec_cmd("wl-paste --type image --watch cliphist store")

hl.exec_cmd("kime-wayland")

hl.exec_cmd("hyprpaper")
hl.exec_cmd("quickshell")

local monitors = require("./monitors")

for i=1, #monitors do
    for j=1, 10 do
        hl.workspace_rule({
            workspace = i .. j % 10,
            monitor = monitors[i],
            persistent = true
        })
    end
end
