return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        -- Disable all functionality except operators and buffers
        require("which-key").register({
            ["<leader>"] = "which_key_ignore",
            ["c"] = "which_key_ignore",
            ["d"] = "which_key_ignore",
            ["g"] = "which_key_ignore",
            ["v"] = "which_key_ignore",
            ["y"] = "which_key_ignore",
            ["z"] = "which_key_ignore",
        })
    end,
    opts = {
        plugins = {
            -- Shows marks on ' and `
            marks = true,
            -- Shows contents of registers
            registers = true,
            -- Shows spelling suggestions with z=
            spelling = {
                enabled = true,
                      suggestions = 10
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = true,
                z = false,
                g = false
            },
        }
    },
}
