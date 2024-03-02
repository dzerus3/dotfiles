return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
        require("catppuccin").setup({
            flavour = "mocha",
            color_overrides = {
                mocha = {
                    base = "#14141F",
                },
            },
        })
    end
}
