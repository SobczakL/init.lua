return {
    'numToStr/Comment.nvim',
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',  -- Add the ts-context-commentstring plugin
    },
    opts = {
        -- Configuration for Comment.nvim
        padding = true,   -- Add a space b/w comment and the line
        sticky = true,    -- Keep the cursor in position
        ignore = nil,     -- Lines to ignore when commenting
        toggler = {
            line = '<leader>//',   -- Line-comment toggle keymap
            block = '<leader>/b',  -- Block-comment toggle keymap
        },
        opleader = {
            line = '<leader>//',   -- Line-comment keymap in NORMAL and VISUAL mode
            block = '<leader>/b',  -- Block-comment keymap in NORMAL and VISUAL mode
        },
        extra = {
            above = '<leader>/k',  -- Add comment on the line above
            below = '<leader>/j',  -- Add comment on the line below
            eol = '<leader>/l',    -- Add comment at the end of line
        },
        mappings = {
            basic = true,  -- Includes basic mappings like `<leader>//` for line and block comments
            extra = true,  -- Includes extra mappings like `<leader>/k`, `<leader>/j`, `<leader>/l`
        },
        -- Pre-hook for JSX/React-specific commenting
        pre_hook = function(ctx)
            -- Only apply for filetypes that need JSX/React comment style
            local U = require('Comment.utils')
            local location = nil
            if ctx.ctype == U.ctype.block then
                location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
                key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
                location = location,
            })
        end,
    },
    config = function(_, opts)
        local comments = require('Comment')
        comments.setup(opts)

        -- Set custom comment strings for JSX/React files
        local ft = require('Comment.ft')
        ft.set('javascriptreact', { '// %s', '{/* %s */}' })
        ft.set('typescriptreact', { '// %s', '{/* %s */}' })
    end,
}

