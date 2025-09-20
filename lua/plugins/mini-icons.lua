return {
  {
    "echasnovski/mini.icons",
    config = function()
      -- Optional: Mock nvim-web-devicons if other plugins expect it
      require("mini.icons").mock_nvim_web_devicons()
    end,
  },
  -- Other plugins that might use icons, e.g., nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "echasnovski/mini.nvim" },
    config = function()
      require("nvim-tree").setup()
    end
  }
}
