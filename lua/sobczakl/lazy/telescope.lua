return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')

        --Parent group set
        vim.keymap.set('n', '<leader>f','', { desc = "Find Group" })

        -- Find files using Telescope
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })

        -- Find files in the Git repository using Telescope
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find files in Git repo" })

        -- Prompt user for a search term and grep using Telescope
        vim.keymap.set('n', '<leader>fg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Grep user input" })

        -- Show help tags using Telescope
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Show help tags" })

        vim.keymap.set('n', '<leader>fw', '', { desc = "Word Search word" })
        -- Grep the current word under cursor using Telescope
        vim.keymap.set('n', '<leader>fws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Grep current word" })

        vim.keymap.set('n', '<leader>fw', '', { desc = "Word Search word with punc" })
        -- Grep the current WORD under cursor (including punctuation) using Telescope
        vim.keymap.set('n', '<leader>fWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Grep current WORD" })

    end
}
