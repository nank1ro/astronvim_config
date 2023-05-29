-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":silent w!<cr>", desc = "Save File" }, -- change description but the same command
    -- move between buffers with <TAB> and <Shift+TAB>
    ["<TAB>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-TAB>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- disable because used by undotree
    ["<leader>ut"] = false,
  },
  t = {
    -- setting a mapping to false will disable it
    ["<esc>"] = false,
    ["jk"] = false,

    ["<c-q>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
    -- ["<esc>"] = { "<C-\\><C-n>" },
  },
  v = {
    -- keep visual mode after indent
    [">"] = { ">gv" },
    ["<"] = { "<gv" },
    -- move selected lines
    ["<M-k>"] = { ":m '<-2<CR>gv=gv", desc = "move line up" },
    ["<M-j>"] = { ":m '>+1<CR>gv=gv", desc = "move line down" },
  },
}
