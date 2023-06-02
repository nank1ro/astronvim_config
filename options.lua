-- create an augroup to easily manage autocommands
vim.api.nvim_create_augroup("diagnostic-color", { clear = true })
-- create a new autocmd on the "User" event
vim.api.nvim_create_autocmd("User", {
  desc = "Change diagnostics underline color", -- nice description
  -- triggered when vim.t.bufs is updated
  pattern = "AstroLspSetup", -- the pattern si the name of our User autocommand events
  group = "diagnostic-color", -- add the autocmd to the newly created augroup
  callback = function()
    vim.cmd [[
      highlight DiagnosticUnderlineInfo guisp=white gui=undercurl
      highlight DiagnosticUnderlineWarn guisp=orange gui=undercurl
      highlight DiagnosticUnderlineError guisp=red gui=undercurl
    ]]
  end,
})
-- deactivate python venv command
vim.api.nvim_create_user_command("VenvDeactivate", function() require("venv-selector").deactivate_venv() end, {})

-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = false, -- sets vim.opt.wrap
    exrc = true,
    guicursor = "n-v-c-sm:block,i-ci-ve:ver5,r-cr-o:hor4",
    swapfile = false,
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
