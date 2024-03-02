return {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
        term_colors = true,
        transparent_background = true,
        flavour = "mocha",
        color_overrides = {
            mocha = {
                base = "#0A0A10",
            },
        },
    },
    priority = 1000,
}
