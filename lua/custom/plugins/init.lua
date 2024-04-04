-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'github/copilot.vim', enabled = false },
  {
    'Exafunction/codeium.nvim',
    -- dependencies = {
    --   'nvim-lua/plenary.nvim',
    --   'hrsh7th/nvim-cmp',
    -- },
    config = function()
      require('codeium').setup {}
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
      local oil = require 'oil'
      oil.setup {
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<leader>-', oil.toggle_float, { desc = 'Toggle parent directory in floating window' })
    end,
  },
}
