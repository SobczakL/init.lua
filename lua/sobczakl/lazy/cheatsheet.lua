return {
  'sudormrfbin/cheatsheet.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim'
  },
  config = function()
    local cheatsheet = require('cheatsheet')
    cheatsheet.setup({
      -- Don't include default cheatsheets
      bundled_cheatsheets = false,
      bundled_plugin_cheatsheets = true,
    })
  end,
}
