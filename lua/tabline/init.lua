vim.opt.showtabline = 2 -- 2 is show always

-- local function iter(tablist)
--     local index = 0
--     local limit = #tablist
--
--     return function()
--         index = index + 1
--         if index <= limit
--         then
--             return tablist[index]
--         end
--     end
-- end

--[[
-- 1 vim functions
-- vim.fn.fnamemodify
-- :help filename-modifier
--]]

-- Generate the string format for the tabline(tabbar)
function Gen_tab_str()
    local str = ""
    for tab,_ in ipairs(vim.api.nvim_list_tabpages()) do
        local curr = vim.api.nvim_tabpage_get_number(0)
        if tab == curr then
            str = str .. "%#TabLineSel#"
            -- append mouse click formating and number string
            str = str .. "%" .. tab .. "T" .. " (" .. tab .. ')'
            local filename = vim.api.nvim_buf_get_name(0)
            if filename ~= "" then
                str = str .. "[ " .. vim.fn.fnamemodify(filename, ':p:.') .. " ]"
            else
                str = str .. " None"
            end
        else
            str = str .. "%#TabLine#"
            str = str .. "%" .. tab .. "T" .. " (" .. tab .. ')'
        end
    end
    str = str .. "%=(PWD)-[" .. os.getenv('PWD') .. ']-%#TabLine#%999X|KILL|'
    return str
end

-- let vim handle refresh with events
vim.opt.tabline = "%!v:lua.Gen_tab_str()" -- '%#TabLineSel#%1T'
