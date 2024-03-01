-- https://github.com/nanotee/nvim-lua-guide
function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(
        mode,
        shortcut,
        command,
        {
            noremap = true,
            silent = true
        }
    )
end

---------------------------------------------------------------
-- Leader key
---------------------------------------------------------------

-- With a map leader it's possible to do extra key combinations
vim.g.mapleader = " "

---------------------------------------------------------------
-- Colemak remappings
---------------------------------------------------------------

-- Movement keys rebound to neio
map("", "n",  "h")
map("", "e",  "j")
map("", "i",  "k")
map("", "o",  "l")
map("", "ge", "gj")
map("", "gi", "gk")

-- Insert mode now bound to l
map("", "l", "i")
map("", "L", "I")
map("", "gl", "gi")

-- Moving to top/bottom of screen
map("", "N", "L")
map("", "O", "H")

-- Hack to work around conflict with `d`elete `i`n
map("n",  "yi", "yk")
map("n",  "vi", "vk")
map("n",  "di", "dk")
map("n",  "ci", "ck")
map("n",  "dd", "dd")

-- Search result navigation with k
map("", "k",  "n")
map("", "K",  "N")
-- Search forward/backward and select
map("", "gk", "gn")
map("", "gK", "gN")
map("", "gn", "")
map("", "gN", "")
map("", "go", "")
map("", "gO", "")

-- Insert mode with newline is now on h
map("", "h", "o")
map("", "H", "O")

-- E and I function like PageUp/Down
map("", "E", "<C-f>")
map("", "I", "<C-b>")

-- Lower case j joins lines
map("", "j", "J")

-- Movement between previous motions
map("", "<C-H>",   "<C-O>")
map("", "<C-S-H>", "<C-I>")

---------------------------------------------------------------
-- Custom mappings
---------------------------------------------------------------


-- Leader-action to delete without copying
map("",  "<leader>x", "\"_x")
map("",  "<leader>X", "\"_X")
map("v",  "<leader>x", "\"_x")

map("",  "<leader>s", "\"_s")
map("",  "<leader>S", "\"_S")
map("v", "<leader>s", "\"_s")

map("",  "<leader>c", "\"_c")
map("",  "<leader>C", "\"_C")
map("v", "<leader>c", "\"_c")

map("",  "<leader>d", "\"_d")
map("",  "<leader>D", "\"_D")
map("v", "<leader>d", "\"_d")

-- Enter clears toggles highlighting
map("", "<CR>", ":set hlsearch!<CR>")

-- Toggles line numbers
map("n", "<leader>ln", ":set number!<CR>")
-- Toggles relative numbers
map("n", "<leader>lr", ":set relativenumber!<CR>")
-- Toggles line numbers and relative numbers
map("n", "<leader>lf", ":set relativenumber!<CR>:set number!<CR>")

-- Leader + h allows highlighting `l`ine or `c`olumn
map("n", "<leader>hl", ":set cursorline!<CR>")
map("n", "<leader>hc", ":set cursorcolumn!<CR>")

-- Disables Ctrl + w in insert mode
map("i", "<C-w>", "")
