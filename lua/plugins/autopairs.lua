return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require('nvim-autopairs').setup({
      check_ts = true,
      ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
      }
    })

    -- Integration with blink.cmp
    local blink_cmp = require('blink.cmp')
    local autopairs = require('nvim-autopairs')

    blink_cmp.setup({
      keymap = {
        ['<CR>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              local autopairs_cr = autopairs.autopairs_cr()
              if autopairs_cr then
                return autopairs_cr
              else
                return cmp.accept()
              end
            end
          end,
          'fallback',
        },
      },
    })
  end
}