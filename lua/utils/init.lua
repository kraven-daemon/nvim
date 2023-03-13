-- Global functions -> for keybindings...
function Toggle_hls()
    if vim.api.nvim_get_option("hls") then
        vim.api.nvim_set_option("hls", false)
    else
        vim.api.nvim_set_option("hls", true)
    end
end

function Trim_space()
    vim.cmd(":%s/\\s\\+$//e")
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

