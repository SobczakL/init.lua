return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Mason for managing LSP and tools
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim", -- LSP progress indicator

        -- null-ls for Prettier formatting and linting
        "jose-elias-alvarez/null-ls.nvim",
    },

    config = function()
        -- Load required modules
        local lspconfig = require('lspconfig')
        local cmp = require('cmp')
        local null_ls = require("null-ls")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Setup Mason and Mason-LSPconfig
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "eslint", -- Linting for JavaScript/TypeScript
            },
        })

        -- Setup null-ls for Prettier and ESLint
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({
                    extra_args = { "--use-tabs", "--tab-width", "4" }, -- Set Prettier to use tabs
                }),
                null_ls.builtins.diagnostics.eslint, -- ESLint for linting
            },
        })

        -- LSP handlers setup (for specific LSPs like tsserver, eslint)
        require("mason-lspconfig").setup_handlers({
            function(server_name) -- Default handler
                lspconfig[server_name].setup({
                    capabilities = capabilities
                })
            end,
            -- Specific configuration for tsserver (JavaScript/TypeScript)
            ["tsserver"] = function()
                lspconfig.tsserver.setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        -- Disable tsserver formatting (we'll use Prettier instead)
                        client.server_capabilities.documentFormattingProvider = false
                    end,
                    root_dir = lspconfig.util.root_pattern("package.json"),
                })
            end,
            -- Specific configuration for eslint (JavaScript/TypeScript linting)
            ["eslint"] = function()
                lspconfig.eslint.setup({
                    capabilities = capabilities,
                    root_dir = lspconfig.util.root_pattern(".eslintrc.js", ".eslintrc.json", "package.json"),
                })
            end,
        })

        -- Setup nvim-cmp for autocompletion
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For LuaSnip users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            }
        })
        -- Diagnostics configuration
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
            },
        })

        -- Optionally, setup fidget for LSP progress
        require("fidget").setup({})
    end
}
