-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'vimpostor/vim-lumen',
  { 'github/copilot.vim' },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    --     -- this is equalent to setup({}) function
  },
  {
    'Exafunction/codeium.vim',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true, desc = 'Codeium: Accept' })
      vim.keymap.set('i', '<c-;>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true, silent = true, desc = 'Codeium: Cycle completions +1' })
      vim.keymap.set('i', '<c-,>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true, silent = true, desc = 'Codeium: Cycle completions -1' })
      vim.keymap.set('i', '<c-x>', function()
        return vim.fn['codeium#Clear']()
      end, { expr = true, silent = true, desc = 'Codeium: Clear' })
    end,
    enabled = false,
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
      -- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<leader>-', oil.toggle_float, { desc = 'Toggle parent directory in floating window' })
    end,
  },
}
