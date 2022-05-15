-- Triggers command based on event

-- Reminders about augroup/autocmd
-- Check events
-- :help event
-- Check groups/cmd
-- :help

local gr = vim.api.nvim_create_augroup("kraven", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    command = "setlocal nonumber norelativenumber foldcolumn=0 signcolumn=no",
    pattern = "*",
    group = gr
})
