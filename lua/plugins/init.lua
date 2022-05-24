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
        use {"wbthomason/packer.nvim"}
        -- lsp
        use "neovim/nvim-lspconfig"
        -- completion
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/nvim-cmp"
        -- snippet
        use "L3MON4D3/LuaSnip"
        use "saadparwaiz1/cmp_luasnip"
        use "mattn/emmet-vim"
        -- Comments
        use "numToStr/Comment.nvim"

        -- Syntax and Treesitter
        use  "preservim/tagbar" -- for ctags and more
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "nvim-treesitter/playground"
        -- Polyglot is a collection of syntax files, for treesitter leftovers
        use "sheerun/vim-polyglot"

        -- Misc
        use "windwp/nvim-autopairs" -- it use treesitter to autopair (){}[]'"'

        -- 3 in 1 , plenary(set of functions), popup(vimbuffer overlay boxes) and telescope(fuzzy finder)
        use {
            "nvim-telescope/telescope-file-browser.nvim",
            requires = {{"nvim-telescope/telescope.nvim"}, {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
        }

        -- Candy
        use "hoob3rt/lualine.nvim" --, -- requires = {"kyazdani42/nvim-web-devicons", opt = true}}
        use "nvim-lua/lsp-status.nvim"
        use "rktjmp/lush.nvim"
        use "chriskempson/base16-vim"

        -- rocks test
        -- use_rocks {"lua-fmt", server = 'https://luarocks.org/dev'}
        -- use_rocks {'luaformatter', server = 'https://luarocks.org/dev'}
    end
)

