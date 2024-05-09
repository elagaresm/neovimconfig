-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = false,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
      }
      vim.cmd 'colorscheme cyberdream' -- set the colorscheme
    end,
  },
  {
    {
      'nvim-lualine/lualine.nvim',
      event = 'VeryLazy',
      -- dependencies = { 'nvim-tree/nvim-web-devicons' }
      config = function()
        local cyberdream = require 'lualine.themes.cyberdream'
        require('lualine').setup {
          -- ... other config
          options = {
            theme = 'cyberdream',
          },
          -- ... other config
        }
      end,
    },
  },
}
