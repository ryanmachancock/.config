return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      preset = "modern",
      delay = 1000,
      expand = 1,
      notify = false,
      replace = {
        key = {
          { "<Space>", "SPC" },
          { "<cr>", "RET" },
          { "<tab>", "TAB" },
        },
      },
    })

    -- Register key groups
    wk.add({
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "git hunks" },
      { "<leader>s", group = "search/replace" },
      { "<leader>t", group = "toggle" },
      { "<leader>c", group = "code" },
    })
  end
}