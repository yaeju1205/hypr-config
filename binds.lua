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

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + SHIFT + mouse_down", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + SHIFT + mouse_up",   hl.dsp.focus({ direction = "left"  }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "-1" }))

hl.bind(mod .. " + CTRL + H", hl.dsp.focus({ monitor = "left" }))
hl.bind(mod .. " + CTRL + L", hl.dsp.focus({ monitor = "right" }))
hl.bind(mod .. " + CTRL + J", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mod .. " + CTRL + K", hl.dsp.focus({ workspace = "-1" }))

hl.bind(mod .. " + CTRL + left", hl.dsp.focus({ monitor = "left" }))
hl.bind(mod .. " + CTRL + down", hl.dsp.focus({ monitor = "down" }))
hl.bind(mod .. " + CTRL + up", hl.dsp.focus({ monitor = "up" }))
hl.bind(mod .. " + CTRL + right", hl.dsp.focus({ monitor = "right" }))

hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

hl.bind(mod .. " + SHIFT + Left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mod .. " + SHIFT + Down",  hl.dsp.window.swap({ direction = "down" }))
hl.bind(mod .. " + SHIFT + Up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mod .. " + SHIFT + Right", hl.dsp.window.swap({ direction = "right" }))

hl.bind(mod .. " + CTRL + SHIFT + H", hl.dsp.window.move({ monitor = "left" }))
hl.bind(mod .. " + CTRL + SHIFT + L", hl.dsp.window.move({ monitor = "right" }))
hl.bind(mod .. " + CTRL + SHIFT + J", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mod .. " + CTRL + SHIFT + K", hl.dsp.window.move({ workspace = "-1" }))

hl.bind(mod .. " + CTRL + SHIFT + Left",  hl.dsp.window.move({ monitor = "left" }))
hl.bind(mod .. " + CTRL + SHIFT + Down",  hl.dsp.window.move({ monitor = "down" }))
hl.bind(mod .. " + CTRL + SHIFT + Up",    hl.dsp.window.move({ monitor = "up" }))
hl.bind(mod .. " + CTRL + SHIFT + Right", hl.dsp.window.move({ monitor = "right" }))

hl.bind(mod .. " + R", hl.dsp.layout("colresize +conf"))
hl.bind(mod .. " + D", hl.dsp.layout("colresize 3conf"))
hl.bind(mod .. " + A", hl.dsp.layout("expel"))

hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
