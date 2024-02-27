return {
    "numToStr/Comment.nvim",
    opts = {
        ignore = '^$',
        extra = {
            -- Add comment on the line above
            above = 'gcK',
            -- Add comment on the line below
            below = 'gck',
            -- Add comment at the end of line
            eol = 'gcA',
        },
    },
    lazy = false
}
