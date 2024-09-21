return {
    {
        "github/copilot.vim",
        cmd = "Copilot",
        config = function()
            -- Any custom configuration for copilot.vim can go here
        end
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken",         -- Only on MacOS or Linux
        opts = {
            debug = true,                -- Enable debugging
            window = {
                layout = 'float',
                relative = 'cursor',
                width = 1,
                height = 0.4,
                row = 1
            },
        },
        event = "VeryLazy", -- Load plugin lazily
        keys = {
            -- Code related commands
            { "<leader>co",    "<cmd>CopilotChatOpen<CR>",      desc = "Open Copilot Chat" },
            { "<leader>cc",    "<cmd>CopilotChatClose<CR>",     desc = "Close Copilot Chat" },
            { "<leader>ct",    "<cmd>CopilotChatToggle<CR>",    desc = "Toggle Copilot Chat" },
            { "<leader>cs",    "<cmd>CopilotChatStop<CR>",      desc = "Stop Copilot Chat Output" },
            { "<leader>cr",    "<cmd>CopilotChatReset<CR>",     desc = "Reset Copilot Chat" },
            { "<leader>csave", "<cmd>CopilotChatSave<CR>",      desc = "Save Copilot Chat History" },
            { "<leader>cl",    "<cmd>CopilotChatLoad<CR>",      desc = "Load Copilot Chat History" },
            { "<leader>cd",    "<cmd>CopilotChatDebugInfo<CR>", desc = "Copilot Chat Debug Info" },
            { "<leader>cm",    "<cmd>CopilotChatModels<CR>",    desc = "View Copilot Models" },
            { "<leader>cM",    "<cmd>CopilotChatModel<CR>",     desc = "View Current Copilot Model" },
            {
                "<leader>cq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                    end
                end,
                desc = "CopilotChat - Quick chat",
            },
            -- Command Shortcuts
            { "<leader>ce", "<cmd>CopilotChatExplain<CR>",       desc = "Explain the Selection" },
            { "<leader>cR", "<cmd>CopilotChatReview<CR>",        desc = "Review the Selection" },
            { "<leader>cf", "<cmd>CopilotChatFix<CR>",           desc = "Fix the Code" },
            { "<leader>cO", "<cmd>CopilotChatOptimize<CR>",      desc = "Optimize the Code" },
            { "<leader>cD", "<cmd>CopilotChatDocs<CR>",          desc = "Add Documentation" },
            { "<leader>cT", "<cmd>CopilotChatTests<CR>",         desc = "Generate Tests" },
            { "<leader>cF", "<cmd>CopilotChatFixDiagnostic<CR>", desc = "Fix Diagnostic Issue" },
            { "<leader>cC", "<cmd>CopilotChatCommit<CR>",        desc = "Write Commit Message" },
            { "<leader>cS", "<cmd>CopilotChatCommitStaged<CR>",  desc = "Write Commit Message for Staged" }
        },
    }
}
