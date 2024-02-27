----------------------------------------------------------------
-- Vim settings
----------------------------------------------------------------

-- Workaround for vim to reset cursor when leaving
vim.cmd([[
    augroup resetcursor
        autocmd!
        autocmd VimLeave * set guicursor=a:ver1-blinkon0
    augroup end
]])

-- Enable syntax highlighting
vim.g.syntax = true

-- Enables 24-bit colors
vim.opt.termguicolors = true

-- Sets encoding to UTF-8
vim.opt.encoding = "UTF-8"

-- Folding
vim.opt.foldmethod = "indent"

-- Disables folding by default
vim.opt.foldenable = false

-- Enables persistent undo
-- FIXME: The if statement doesn't seem to work correctly
vim.opt.undofile = true
if(vim.env.XDG_STATE_HOME == nil)
    then
    vim.opt.undodir = vim.env.HOME .. "/.local/state/nvim/undo"
else
    vim.opt.undodir = vim.env.XDG_STATE_HOME .. "/nvim/undo"
end

-- Disables swapfiles
vim.opt.swapfile = false

-- Number of lines that remain visible cursor when scrolling
vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 7

-- Disables showing mode on the bottom. Should be obvious from cursor
--vim.opt.showmode = false

-- Disables wrapping
vim.opt.wrap = false

-- Visible whitespace
-- See :help lua line 1139
vim.opt.list = true
vim.opt.listchars = {
    trail      = "-",
    tab        = "▸ ",
    extends    = "❱",
    precedes   = "❰",
    multispace = "·",
    lead       = " "
}

-- Don't insert completion option until it is selected
vim.opt.completeopt = {
    "noinsert",
    "menuone",
    "noselect"
}

-- Height of the command bar
vim.opt.cmdheight = 1

-- Case sensitive search only when at least one capital is
-- present
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Start searching before pressing enter
vim.opt.incsearch = true

-- Make it so vim handles numbers with leading zeroes correctly
vim.opt.nrformats:remove {"octal"}

-- Enables relative numbers
vim.opt.relativenumber = true
-- Enables highlighting of current line number
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Tweaks for working with manpages, help, and plaintext
vim.cmd([[
    augroup plaintext
        autocmd!

        " Applies to markdown, plaintext, and LATEX
        autocmd FileType markdown,text,plaintex
        \ setlocal norelativenumber  " Disables relative numbers
        autocmd FileType markdown,text,plaintex
        \ setlocal wrap              " Enables line wrapping
        autocmd FileType markdown,text,plaintex
        \ setlocal linebreak         " Makes lines break at spaces
        autocmd FileType markdown,text,plaintex
        \ setlocal display+=lastline " TODO: What does this do?

        " Applies to man and help pages
        autocmd FileType man,help
        \ setlocal scrolloff=99999    " Always centers screen
        autocmd FileType man,help
        \ nnoremap <buffer> q :q!<CR> " Rebinds q to quit
    augroup end
]])

-- Remember position after exiting file
vim.cmd([[
    augroup fileposition
        autocmd!
        autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft =~ 'gitcommit'
        \ | exe "normal! g'\"" | endif
    augroup end
]])

-- Auto yank to clipboard
vim.opt.clipboard="unnamedplus"

-- Sets the number of lines of history that will be stored
vim.opt.history = 50

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true

-- How many tenths of a second to blink when matching brackets
vim.opt.matchtime = 2

-- Allows backspace to delete everything
vim.opt.backspace = {
    "eol",
    "start",
    "indent"
}

vim.opt.wrap = false

-- Don't redraw while executing macros; improves performance
vim.opt.lazyredraw = true

-- Ignore useless files with :e
-- Check :help lua.txt line 1114
vim.opt.wildignore = {
    -- Version control
    "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store",
    -- Compiled files
    "*.o", "*.elf", "*.pyc", "*.bin", "*.exe", "*.msi",
    -- Images
    "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.ico",
    -- Binary documents
    "*.pdf", "*.doc*", "*.xls*", "*.ppt*", "*.odt", "*.djvu", "*.fb2",
    -- Archives
    "*.zip", "*.tar", "*.rar", "*.7z", "*.gz", "*.bz2",
    -- Audio
    "*.mp3", "*.opus", "*.wav", "*.flac", "*.m4a", "*.m4b",
    -- Video
    "*.mp4", "*.mkv", "*.webm", "*.avi",
    -- Miscellaneous
    "*.dat", "*.db", "*.iso", "*.img", "*.torrent"
}

-- Set tab size to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

-- Auto convert tabs to spaces
vim.opt.expandtab = true

-- Disables netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
