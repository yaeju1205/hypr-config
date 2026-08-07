local monitors = {
    "DVI-D-1",
    "HDMI-A-1",
}

hl.monitor({
    output   = monitors[1],
    mode     = "preferred",
    position = "0x0",
    scale    = 1.
})

hl.monitor({
    output   = monitors[2],
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

return monitors
