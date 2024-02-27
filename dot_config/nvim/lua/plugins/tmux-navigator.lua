return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
  },
  keys = {
    { "<M-n>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<M-e>", "<cmd>TmuxNavigateDown<cr>" },
    { "<M-i>", "<cmd>TmuxNavigateUp<cr>" },
    { "<M-o>", "<cmd>TmuxNavigateRight<cr>" },
  },
}
