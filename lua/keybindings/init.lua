-- Function that map keys
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--- KEYMAP
---
vim.g.mapleader = " "



--[[  PLUGINS ]]

-- Tagbar
map("n", "<leader>t", ":TagbarToggle<CR>")
map("n", "<leader>tn", ":TagbarJumpNext<CR>")
map("n", "<leader>tv", ":TagbarJumpPrev<CR>")

-- Telescope 
map('n', '<leader>b', ':Telescope buffers<CR>')
map('n', '<leader>f', ':Telescope find_files<CR>')
--
--[[  UTILS ]]
map("n", "<leader>h", ":lua Toggle_hls()<CR>")
-- map("n", "<leader>u", ":lua Trim_space()<CR>")


-- buffers
map('n', '<leader>B', ':bufdo bd<CR>')
map('n', '<leader>n', ':bnext<CR>')
map('n', '<leader>v', ':bprevious<CR>')
-- smart yanking
map("n", "Y", "y$")

-- Keeping it centered, when moving in search or joining lines
map("n", "j", "jzz")
map("n", "k", "kzz")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`zzz")

-- Undo breakpoints, pretty usefull
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")

-- move line[s] like a champ
map("n", "<leader>k", ":m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")
map("i", "<C-k>", "<esc>:m .-2<CR>")
map("i", "<C-j>", "<esc>:m .+1<CR>")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")


-- Window Move => alt + h|j|k|l everywhere except for visualmode
map("t", "<A-h>", "<C-\\><C-N><C-w>h")
map("t", "<A-j>", "<C-\\><C-N><C-w>j")
map("t", "<A-k>", "<C-\\><C-N><C-w>k")
map("t", "<A-l>", "<C-\\><C-N><C-w>l")
map("i", "<A-h>", "<ESC><C-w>h")
map("i", "<A-j>", "<ESC><C-w>j")
map("i", "<A-k>", "<ESC><C-w>k")
map("i", "<A-l>", "<ESC><C-w>l")
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- Window Resize
map("n", "+", "<C-w>2+" )
map("n", "_", "<C-w>2-" )
map("n", "=", "<C-w>2<" )
map("n", "-", "<C-w>2>" )

-- Tabs like browser
map("n", "<M-t>", ":tabnew<CR>")
map("i", "<A-t>", "<ESC>:tabnew<CR>")
map("v", "<A-t>", "<ESC>:tabnew<CR>")
map("n", "<A-w>", ":tabclose<CR>")
map("i", "<A-w>", "<ESC>:tabclose<CR>")
map("v", "<A-w>", "<ESC>:tabclose<CR>")
map("n", "<A-1>", "1gt")
map("n", "<A-2>", "2gt")
map("n", "<A-3>", "3gt")
map("n", "<A-4>", "4gt")
map("n", "<A-5>", "5gt")


