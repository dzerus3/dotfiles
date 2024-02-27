---------------------------------------------------------------
-- Status line
--
-- Inspired by elements of:
-- https://stackoverflow.com/a/5380230
-- https://stackoverflow.com/a/10416234
-- https://github.com/amix/vimrc
---------------------------------------------------------------

-- This function tracks the word count, used for statusline
-- Taken from: https://vim.fandom.com/wiki/Word_count
vim.cmd([[
    let g:word_count=wordcount().words
    function WordCount()
        if has_key(wordcount(),'visual_words')
            let g:word_count=wordcount().visual_words."/".wordcount().words " count selected words
        else
            let g:word_count=wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
        endif
        return g:word_count
    endfunction
]])

-- https://vi.stackexchange.com/questions/36876/see-live-word-count-in-lualine
local function getWords()
    return tostring(vim.fn.wordcount().words)
end

-- Always show the status line
vim.opt.laststatus=2

-- Colors for status line
vim.cmd([[
    highlight User1 guifg=#CE933B guibg=#333333
    highlight User2 guifg=#76CE3B guibg=#333333
    highlight User3 guifg=#933BCE guibg=#333333
    highlight User4 guifg=#EA5031 guibg=#333333
    highlight User5 guifg=#F2E863 guibg=#333333
    highlight User6 guifg=#CCCCCC guibg=#333333
    highlight User7 guifg=#FFFFFF guibg=#333333
]])

vim.opt.statusline = table.concat({
    -- Buffer number
    "%1* %02n %*",
    -- File name (up to 40 characters)
    "%2*%<%.40t%*",
    -- File type
    "%3* %Y %*",
    -- Flags (modified, readonly, help, etc.)
    "%4*%m%r%w%h%*",
    -- Separator
    "%1*%=",
    -- Column number
    "%5*%c%6*:",
    -- Row number/Number of rows
    "%5*%l%6*/%1*%L",
    -- Percentage of location
    "%7*%6p%%  "
})

-- If inside a plaintext file, add word count to status line
vim.cmd([[
    augroup statusline
    autocmd!
    autocmd FileType markdown,text,plaintex
        \ set statusline+=\ w:%{WordCount()}\ \ 
    augroup end
]])
