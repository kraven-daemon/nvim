-- Plugins and luarocks imported
-- :PackerSync to trigger all steps

-- rocks to investigate
-- apparently lua-fmt pretty nice to
-- rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
-- use_rocks {'lua-cjson', 'lua-resty-http'}
-- use_rocks {'openssl' env = {OPENSSL_DIR = "/path/to/dir"}}

-------------------- Ensure packer is installed ------------
-- `data` directory -> XDG_DATA_HOME
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd("packadd packer.nvim")
end

local packer = require('packer')
-- aliasing use to remove annoying lsp warnings of undefined global ...
local use = packer.use
-- local use_rocks = packer.use_rocks

packer.startup(
    function()
        use "wbthomason/packer.nvim"
        use({
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!:).
            run = "make install_jsregexp"
        })



        -- language helpers
        use "neovim/nvim-lspconfig"
        use "williamboman/mason.nvim"

        -- completion
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        -- snippet
        use 'honza/vim-snippets'
        use "mattn/emmet-vim"

        -- Comments
        use "numToStr/Comment.nvim"

        -- Syntax and Treesitter
        use "preservim/tagbar" -- for ctags and more
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/playground"
        --
        -- Misc
        use "windwp/nvim-autopairs" -- it use treesitter to autopair (){}[]'"'

        -- Nagivation, everywhere
        use "nvim-lua/popup.nvim" -- boxes
        use "nvim-lua/plenary.nvim" -- set of functions
        use "nvim-telescope/telescope.nvim" -- fuzzy finder

        -- Candy
        use "hoob3rt/lualine.nvim" -- require a nerdfonts or web-devicon
        use "nvim-lua/lsp-status.nvim"
        use "rktjmp/lush.nvim"
        use "chriskempson/base16-vim"
    end
)

