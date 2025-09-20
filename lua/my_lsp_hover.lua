-- Table of preferred LSPs per filetype
local preferred_by_ft = {
  javascript = "tsserver",
  typescript = "tsserver",
  lua = "lua_ls",
  bash = "bashls",
  json = "jsonls",
  yaml = "yamlls",
}

local function hover_auto()
  local ft = vim.bo.filetype
  local clients = vim.lsp.get_clients({bufnr = 0})
  if #clients == 0 then
    print("No LSP client attached")
    return
  end

  -- Pick preferred client by filetype, fallback to first client
  local client_name = preferred_by_ft[ft]
  local client
  if client_name then
    client = vim.tbl_filter(function(c) return c.name == client_name end, clients)[1]
  end
  if not client then
    client = clients[1]
  end

  vim.lsp.buf_request(0, "textDocument/hover", vim.lsp.util.make_position_params(), function(err, result, ctx, _)
    if err then return end
    if not (result and result.contents) then return end
    vim.lsp.util.focusable_float(0, function()
      return vim.lsp.util.open_floating_preview({result.contents}, "markdown")
    end)
  end, client.id)
end

