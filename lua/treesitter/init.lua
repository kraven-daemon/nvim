-- https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup {
    ensure_installed = {
        -- sys
        "bash", "lua", "jq", "nix", "python", "regex",

        -- web
        "html", "css", "scss",
        "javascript", "typescript",
        "astro", "svelte", "vue", "tsx",
        "jsdoc",

        -- crossplatform/mobile
        "java",
        "dart",
        "kotlin",
        "swift",

        -- lowlvl
        "llvm",
        "rust",
        "c", "cpp",
        "glsl",
        "meson",
        "ninja",
        "cmake",

        -- data
        "sql",
        "graphql",
        "ini",
        "yaml", "toml", "json",
        "hjson",
        "jsonc",
        "json5",
        "jsonnet",
        "mermaid",

        -- vim
        "help",
        "vim",

        -- occasionnal
        "erlang",
        "elixir",
        "go",
        "gomod",
        "gosum",

        -- misc
        "make",
        "latex",
        "comment", -- TODO: asd, XXX: fix, ...
        "diff",
        "dockerfile",
        -- "gitconfig",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "http",
        "markdown",
        "markdown_inline"
    -- sxhkdrc"
    -- terraform"
    -- todotxt"
    -- "ungrammar"
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
