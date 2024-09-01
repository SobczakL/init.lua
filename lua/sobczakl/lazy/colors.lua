return {
  -- Adding the rose-pine theme plugin
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    -- Setup for the rose-pine theme
    require('rose-pine').setup({
      disable_background = true
    })

    -- Function to apply the colorscheme and set custom highlights
    function ColorMyPencils(color)
      color = color or "rose-pine"
      vim.cmd.colorscheme(color)
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end

    -- Use an autocmd to apply the colorscheme after all plugins have loaded
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        ColorMyPencils()
      end,
    })
  end,
}
