vim.g.mapleader = " "
-- Leader key set to space

-- General commands
vim.keymap.set("n", ";", ":", { desc = "Command mode" })
vim.keymap.set("n", "<leader>p", '', { desc = "Project View Group" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View" })

-- Visual mode mappings
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

-- Normal mode mappings
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line without moving cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

vim.keymap.set("n", "<leader>l", "", { desc = "Restart LSP Group" })
vim.keymap.set("n", "<leader>lsp", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- NvimTree toggle and focus
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- Buffer navigation and management
vim.keymap.set("n", "<leader>b", "", { desc = "Buffers Group" })
vim.keymap.set("n", "<leader>bl", "<cmd>:ls<CR>", { desc = "List buffers" })
vim.keymap.set("n", "<tab>", "<cmd>:bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-tab>", "<cmd>:bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bx", "<cmd>:bd!<CR>", { desc = "Force delete buffer" })
vim.keymap.set("n", "<leader>bh", "<cmd>:split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>bv", "<cmd>:vsplit<CR>", { desc = "Vertical split" })

-- Clipboard operations
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste and keep clipboard content" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete and keep clipboard content" })

-- Miscellaneous
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set("n", "<S-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<S-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source file" })
