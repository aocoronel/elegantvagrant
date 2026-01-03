local elegantvagrant = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f067fc",
    mauve = "#cba6f7",
    red = "#f38ba8",
    maroon = "#eba0ac",
    peach = "#fab387",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    teal = "#94e2d5",
    sky = "#20dbfc",
    sapphire = "#74c7ec",
    blue = "#5ffcfc",
    lavender = "#b4befe",
    text = "#d9d9d9",
    subtext1 = "#bac2de",
    subtext0 = "#a6adc8",
    overlay2 = "#9399b2",
    overlay1 = "#7f849c",
    overlay0 = "#6c7086",
    surface2 = "#585b70",
    surface1 = "#191919",
    surface0 = "#121311",
    base = "#000000",
    mantle = "#090909",
    crust = "#111111",
}

local elegantvagrant_highlights = function(colors)
    return {
        LineNr = { fg = "#393939" },
        CursorLineNr = { fg = colors.subtext1, bold = true },
        Comment = { fg = colors.yellow }, -- Golden Comments

        -- Mini Statusbar
        MiniStatuslineModeNormal = { fg = colors.base, bg = "#7C5CFF" },
        MiniStatuslineModeInsert = { fg = colors.base, bg = "#f067fc" },
        MiniStatuslineModeVisual = { fg = colors.base, bg = "#02f789" },
        MiniStatuslineModeReplace = { fg = colors.base, bg = "#f4f113" },
        MiniStatuslineModeCommand = { fg = colors.base, bg = "#46d9ff" },
        MiniStatuslineModeOther = { fg = colors.base, bg = "#f38ba8" },
    }
end
