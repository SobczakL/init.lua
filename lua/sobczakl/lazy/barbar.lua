return {
    'romgrk/barbar.nvim',
    version = "^1..",
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        local status_ok, barbar = pcall(require, "barbar")
        if not status_ok then
            return
        end

        -- Set barbar.nvim options here
        barbar.setup {
            -- Example options, you can customize these
            animation = true,
            auto_hide = false,
            insert_at_start = true,
            -- Other options...
        }

        -- Key mappings for buffer navigation
        vim.keymap.set("n", "<leader>b", "", { desc = "Buffers Group" })
        vim.keymap.set("n", "<S-tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
        vim.keymap.set("n", "<tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
        vim.keymap.set("n", "<leader>bd", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
        vim.keymap.set("n", "<leader>bp", "<Cmd>BufferPick<CR>", { desc = "Pick buffer" })
        vim.keymap.set("n", "<leader>b1", "<Cmd>BufferGoto 1<CR>", { desc = "Go to buffer 1" })
        vim.keymap.set("n", "<leader>b2", "<Cmd>BufferGoto 2<CR>", { desc = "Go to buffer 2" })
        vim.keymap.set("n", "<leader>b3", "<Cmd>BufferGoto 3<CR>", { desc = "Go to buffer 3" })
        vim.keymap.set("n", "<leader>b4", "<Cmd>BufferGoto 4<CR>", { desc = "Go to buffer 4" })
        vim.keymap.set("n", "<leader>b5", "<Cmd>BufferGoto 5<CR>", { desc = "Go to buffer 5" })
        vim.keymap.set("n", "<leader>b6", "<Cmd>BufferGoto 6<CR>", { desc = "Go to buffer 6" })
        vim.keymap.set("n", "<leader>b7", "<Cmd>BufferGoto 7<CR>", { desc = "Go to buffer 7" })
        vim.keymap.set("n", "<leader>b8", "<Cmd>BufferGoto 8<CR>", { desc = "Go to buffer 8" })
        vim.keymap.set("n", "<leader>b9", "<Cmd>BufferGoto 9<CR>", { desc = "Go to buffer 9" })
        vim.keymap.set("n", "<leader>b0", "<Cmd>BufferLast<CR>", { desc = "Go to last buffer" })
    end,
}
