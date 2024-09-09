return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        -- Autocomplete HTML and JSX tags
        "windwp/nvim-ts-autotag",
    },
    config = function()
        -- Setup Treesitter
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                "jsdoc", "bash",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            -- Enable indentation
            indent = {
                enable = true
            },

            -- Enable highlighting
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        -- Set up custom parser for templ
        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")

        -- Setup nvim-ts-autotag separately
        require('nvim-ts-autotag').setup()
    end
}
