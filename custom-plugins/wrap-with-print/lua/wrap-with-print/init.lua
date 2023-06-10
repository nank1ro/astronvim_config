local M = {}

-- Wrap identifiers into a Dart print statement, for example:
-- count number
-- -- becomes
-- print("count: $count number: $number");
M.wrap = function()
  local line = vim.api.nvim_get_current_line()
  local words = {}
  for word in line:gmatch "%S+" do
    table.insert(words, word)
  end

  -- keep the indentation of the line
  local initial_spaces = ""
  for c in line:gmatch "." do
    -- do something with c
    if c == " " then
      initial_spaces = initial_spaces .. " "
    elseif c ~= " " then
      break
    end
  end

  local str = initial_spaces .. 'print("'
  for i, v in pairs(words) do
    -- check if str contains a dot
    if string.find(v, "%.") then
      str = str .. v .. ": ${" .. v .. "}"
    else
      str = str .. v .. ": $" .. v
    end
    if i ~= #words then str = str .. " " end
  end

  str = str .. '");'

  vim.api.nvim_set_current_line(str)
end

return M
