local monitors = require("./monitors")

local mod = "SUPER"

hl.bind(mod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("xdg-open https://"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("xdg-open ."))
hl.bind(mod .. " + Q", hl.dsp.window.close())

hl.bind(mod .. " + 0", function()
    local monitor = hl.get_active_monitor().name

    for i=1, #monitors do
        if monitor == monitors[i] then
            hl.dispatch(hl.dsp.focus({ workspace = i * 10 }))
            break
        end
    end
end)

hl.bind(mod .. " + SHIFT + 0", function()
    local monitor = hl.get_active_monitor().name

    for i=1, #monitors do
        if monitor == monitors[i] then
            hl.dispatch(hl.dsp.window.move({ workspace = i * 10 }))
            break
        end
    end
end)

for i=1, 9 do
    local key = i % 10

    hl.bind(mod .. " + " .. key, function()
        local monitor = hl.get_active_monitor().name

        for j=1, #monitors do
            if monitor == monitors[j] then
                hl.dispatch(hl.dsp.focus({ workspace = j * 10 + i }))
                break
            end
        end
    end)

    hl.bind(mod .. " + SHIFT + " .. key, function()
        local monitor = hl.get_active_monitor().name

        for j=1, #monitors do
            if monitor == monitors[j] then
                hl.dispatch(hl.dsp.window.move({ workspace = j * 10 + i }))
                break
            end
        end
    end)
end

local function workspace_focus_up()
    local workspace = hl.get_active_workspace().id % 10

    if workspace <= 0 then
        return
    end

    hl.dispatch(hl.dsp.focus({ workspace = "-1" }))
end

local function workspace_focus_down()
    local workspace = hl.get_active_workspace().id % 10

    if workspace >= 9 then
        return
    end

    hl.dispatch(hl.dsp.focus({ workspace = "+1" }))
end

local function workspace_move_up()
    local workspace = hl.get_active_workspace().id % 10

    if workspace <= 0 then
        return
    end

    hl.dispatch(hl.dsp.window.move({ workspace = "-1" }))
end

local function workspace_move_down()
    local workspace = hl.get_active_workspace().id % 10

    if workspace >= 9 then
        return
    end

    hl.dispatch(hl.dsp.window.move({ workspace = "+1" }))
end

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mod .. " + CTRL + H", hl.dsp.focus({ monitor = "left" }))
hl.bind(mod .. " + CTRL + J", workspace_focus_down)
hl.bind(mod .. " + CTRL + K", workspace_focus_up)
hl.bind(mod .. " + CTRL + L", hl.dsp.focus({ monitor = "right" }))

hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

hl.bind(mod .. " + ALT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mod .. " + ALT + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mod .. " + ALT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mod .. " + ALT + L", hl.dsp.window.swap({ direction = "right" }))

hl.bind(mod .. " + CTRL + SHIFT + H", hl.dsp.window.move({ monitor = "left" }))
hl.bind(mod .. " + CTRL + SHIFT + J", workspace_move_down)
hl.bind(mod .. " + CTRL + SHIFT + K", workspace_move_up)
hl.bind(mod .. " + CTRL + SHIFT + L", hl.dsp.window.move({ monitor = "right" }))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ direction = "left"  }))

hl.bind(mod .. " + SHIFT + mouse_down", workspace_focus_down)
hl.bind(mod .. " + SHIFT + mouse_up",   workspace_focus_up)

hl.bind(mod .. " + R", hl.dsp.layout("colresize +conf"))
hl.bind(mod .. " + D", hl.dsp.layout("colresize 3conf"))

hl.bind(mod .. " + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
