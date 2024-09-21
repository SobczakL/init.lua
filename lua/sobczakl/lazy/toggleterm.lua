return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local status_ok, toggleterm = pcall(require, "toggleterm")
    if not status_ok then
        return
    end

    toggleterm.setup {
        size = 20,
        open_mapping = [[<c-t>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = false,
        insert_mappings = true,
        persist_size = false,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "rounded",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
        winbar = {
            enabled = true,
            name_formatter = function(term)
                return term.count
            end,
        },
    }

    -- Terminal key mappings
    function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<C-x>', [[<C-\><C-n>]], opts) -- Exit terminal mode
        vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], opts) -- Normal mode in terminal
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts) -- Move to the left window
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts) -- Move to the window below
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts) -- Move to the window above
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts) -- Move to the right window
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts) -- Window manipulation in terminal
    end

    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

    -- Lazygit setup
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = false,
        direction = "float",
        float_opts = {
            border = "rounded",
        },
    })

    function _LAZYGIT_TOGGLE()
        lazygit:toggle()
        if lazygit:is_open() then
            vim.api.nvim_buf_set_keymap(lazygit.bufnr, 't', '<C-x>', [[<C-\><C-n>]], { noremap = true, silent = true })
        end
    end

    vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

    -- Additional terminal mappings for common use-cases
    -- Horizontal terminal
    local horizontal_term = Terminal:new({ direction = "horizontal" })
    function _HORIZONTAL_TOGGLE()
        horizontal_term:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _HORIZONTAL_TOGGLE()<CR>", { noremap = true, silent = true })

    -- Vertical terminal
    local vertical_term = Terminal:new({ direction = "vertical" })
    function _VERTICAL_TOGGLE()
        vertical_term:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>lua _VERTICAL_TOGGLE()<CR>", { noremap = true, silent = true })

    -- New empty terminal
    local float_term = Terminal:new({ direction = "float" })
    function _FLOATING_TOGGLE()
        float_term:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua _FLOATING_TOGGLE()<CR>", { noremap = true, silent = true })
  end,
}
