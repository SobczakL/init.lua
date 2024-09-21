return {
    'romgrk/barbar.nvim',
    version = "^1..",
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
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
        vim.keymap.set("n", "<leader>b0", "<Cmd>BufferLast<CR>", { desc = "Go to last buffer" })

        -- Additional buffer commands
        vim.keymap.set("n", "<leader>bl", "<Cmd>ls<CR>", { desc = "List all buffers" })
        vim.keymap.set("n", "<leader>bo", "<Cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all but current buffer" })
        vim.keymap.set("n", "<leader>br", "<Cmd>BufferCloseAllButPinned<CR>", { desc = "Close all but pinned buffers" })
        vim.keymap.set("n", "<leader>bs", "<Cmd>BufferSortByDirectory<CR>", { desc = "Sort buffers by directory" })
        vim.keymap.set("n", "<leader>bS", "<Cmd>BufferSortByExtension<CR>", { desc = "Sort buffers by file extension" })
        vim.keymap.set("n", "<leader>b>", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer to the next position" })
        vim.keymap.set("n", "<leader>b<", "<Cmd>BufferMovePrevious<CR>",
            { desc = "Move buffer to the previous position" })
        vim.keymap.set("n", "<leader>be", "<Cmd>enew<CR>", { desc = "Open new empty buffer" })
        vim.keymap.set("n", "<leader>bb", "<Cmd>BufferFirst<CR>", { desc = "Go to first buffer" })
        vim.keymap.set("n", "<leader>bB", "<Cmd>BufferLast<CR>", { desc = "Go to last buffer" })
    end,
}
