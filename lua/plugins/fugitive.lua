return {
  'tpope/vim-fugitive',
  config = function()
    -- Key mappings for fugitive
    vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = 'Git status' })
    vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>', { desc = 'Git blame' })
    vim.keymap.set('n', '<leader>gd', '<cmd>Gdiff<CR>', { desc = 'Git diff' })
    vim.keymap.set('n', '<leader>gl', '<cmd>Git log<CR>', { desc = 'Git log' })
    vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'Git push' })
    vim.keymap.set('n', '<leader>gP', '<cmd>Git pull<CR>', { desc = 'Git pull' })
  end
}