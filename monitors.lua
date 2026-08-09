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

hl.workspace_rule({
    workspace = "10",
    monitor = monitors[1],
    persistent = true,
    default = true
})

hl.workspace_rule({
    workspace = "20",
    monitor = monitors[2],
    persistent = true,
    default = true
})

hl.dsp.focus({
    workspace = 20,
    monitor = monitors[2],
})

return monitors
