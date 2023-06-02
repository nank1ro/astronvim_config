local ts_utils = require "nvim-treesitter.ts_utils"
local M = {}

local get_master_node = function()
  local node = ts_utils.get_node_at_cursor()
  if node == nil then error "No Treesitter parser found" end

  local root = ts_utils.get_root_for_node(node)
  local start_row = node:start()
  local parent = node:parent()

  while parent ~= nil and parent ~= root and parent:start() == start_row do
    node = parent
    parent = node:parent()
  end

  return node
end

local text_from_variable = function(bufnr, node)
  local node_type = node.type(node)
  if node_type == "identifier" or node_type == "type_identifier" then
    return vim.treesitter.get_node_text(node, bufnr)
  end
  return nil
end

M.wrap = function()
  local node = get_master_node()

  local bufnr = vim.api.nvim_get_current_buf()
  local variables = {}

  local text_from_node = text_from_variable(bufnr, node)
  if text_from_node ~= nil then table.insert(variables, text_from_node) end

  for child in node.iter_children(node) do
    local text_from_child_node = text_from_variable(bufnr, child)
    if text_from_child_node ~= nil then table.insert(variables, text_from_child_node) end
  end
  local start_row, start_col, end_row, end_col = node:range()

  local str = 'print("'
  for i, v in pairs(variables) do
    str = str .. v .. ": $" .. v
    if i ~= #variables then str = str .. " " end
  end

  str = str .. '");'

  vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, { str })
end

return M
