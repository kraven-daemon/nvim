-- https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "awk", "bash",
        "html", "css", "jsonc", "json", "javascript", "typescript",
        "astro",
        "dart",

        "git_rebase",
        "gitattributes",
        "gitcommit",
        "glsl",
        "go",
        "graphql",
        "help",
        "hjson",
        "hlsl",
        "hocon",
        "http",
        "ini",
        "java",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "jsonnet",

        "lua",
        "c", "cpp",
        "cmake", "dockerfile",
        "dart",             -- mobile
        "comment",  "diff"  -- others

    },
    highlight = {enable = true},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-n>",
            node_incremental = "<c-n>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-m>",
        }
    },
    indent = {enable = true},
    textobects = {
        select = {
            enable = true
        }
    },
    -- disable :syntax from vim
    additional_vim_regex_highlighting = false,
}
