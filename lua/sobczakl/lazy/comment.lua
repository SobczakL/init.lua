return {
    'numToStr/Comment.nvim',
    opts = {
        -- Add any other options here
        mappings = {
            -- Define your custom keymaps here
            basic = true,  -- Includes `gcc`, `gbc`, etc.
            extra = true,  -- Includes `gc{motion}`, `gb{motion}`
            extended = false, -- Includes `gcA`, `gcO`, `gc$`, etc.
        },
    },
    config = function(_, opts)
        require('Comment').setup(opts)

        -- Set custom keymaps if needed
        local ft = require('Comment.ft')
        ft.set('lua', { '-- %s', '--[[ %s ]]' })  -- Example: Lua comment strings

        -- Example of custom keymaps
        vim.keymap.set('n', '<leader>c', '', { desc = 'Comment' })
        vim.keymap.set('n', '<leader>cl', 'gcc', { noremap = true, silent = true, desc = 'Comment line' })
        vim.keymap.set('n', '<leader>cb', 'gbc', { noremap = true, silent = true, desc = 'Comment block' })
        vim.keymap.set('n', '<leader>cn', 'gco', { noremap = true, silent = true, desc = 'Comment line next' })
        vim.keymap.set('n', '<leader>cp', 'gcO', { noremap = true, silent = true, desc = 'Comment line prev' })
        vim.keymap.set('v', '<leader>ca', 'gcA', { noremap = true, silent = true, desc = 'Comment line end' })
        vim.keymap.set('v', '<leader>cb', 'gb', { noremap = true, silent = true, desc = 'Comment selection block' })
    end,
}
