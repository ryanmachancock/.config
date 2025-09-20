return {
  'christoomey/vim-tmux-navigator',
  lazy = false,
  config = function()
    -- Key mappings for vim-tmux-navigator
    vim.keymap.set('n', '<C-h>', '<Cmd>TmuxNavigateLeft<CR>', { desc = 'Navigate left' })
    vim.keymap.set('n', '<C-j>', '<Cmd>TmuxNavigateDown<CR>', { desc = 'Navigate down' })
    vim.keymap.set('n', '<C-k>', '<Cmd>TmuxNavigateUp<CR>', { desc = 'Navigate up' })
    vim.keymap.set('n', '<C-l>', '<Cmd>TmuxNavigateRight<CR>', { desc = 'Navigate right' })
    vim.keymap.set('n', '<C-\\>', '<Cmd>TmuxNavigatePrevious<CR>', { desc = 'Navigate to previous pane' })
  end
}