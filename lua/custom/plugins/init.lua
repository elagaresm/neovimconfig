-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'github/copilot.vim',
  {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
      local oil = require 'oil'
      oil.setup()
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<leader>-', oil.toggle_float, { desc = 'Toggle parent directory in floating window' })
    end,
  },
}
