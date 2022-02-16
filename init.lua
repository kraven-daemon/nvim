---@diagnostic disable: undefined-global
--
-- Some safety require wrapper
local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
        return nil
end

-- Global functions -> for keybindings...
function Toggle_hls()
    if vim.api.nvim_get_option("hls") then
        vim.api.nvim_set_option("hls", false)
    else
        vim.api.nvim_set_option("hls", true)
    end
end

function Trim_space()
    cmd(":%s/\\s\\+$//e")
end

function _G.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

-- The order may have impact
-- just load things by general > to < precise
prequire("plugins")
prequire("treesitter")
prequire("lsp")
prequire("filebrowser")
prequire("options")
-- Using treesitter block scope,
-- Load after treesitter
prequire("nvim-autopairs").setup{
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
}

prequire('statusline') -- lualine
prequire('keybindings')


-- about menu help: IME
-- :source $VIMRUNTIME/menu.vim
-- :set wildmenu
-- :set cpo-=<
-- :set wcm=<C-Z>
-- :map <F4> :emenu <C-Z>

prequire("auto-events")
-- Nice little rock
-- require("test-fmt")



