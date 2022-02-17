-- Completion, lsp, and snippet
-- ressources
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- https://github.com/sumneko/lua-language-server
-- luasnip

-- TODO: set completeopt=menu,menuone,noselect

-- LSP
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')

-- Lua need special care, because its not meant to be used `systemwide`
-- Just overload with a bunch of path
local lua_runtime_path = vim.split(package.path, ';')
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")
table.insert(lua_runtime_path, vim.fn.expand('~/.luarocks/share/lua/5.3/?.lua'))
table.insert(lua_runtime_path, vim.fn.expand('~/.luarocks/share/lua/5.3/?/init.lua'))
table.insert(lua_runtime_path, '/usr/share/awesome/lib/?.lua')
table.insert(lua_runtime_path, '/usr/share/awesome/lib/?/init.lua')

-- print(vim.inspect(lua_runtime_path))

--[[
-- TODO check for a general method and modify lua path accordingly
-- if os.execute("test -d /usr/share/awesome/lib/") then print("awesome") end
--]]

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      -- include a bunch of paths in table format
      runtime = {
        version = 'LuaJIT',
        path = lua_runtime_path
      },
      diagnostics = {
        -- lsp now recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- for the general library
        library = {
          vim.fn.expand('~/.luarocks/share/lua/5.1'),
          vim.api.nvim_get_runtime_file("", true),
          '/usr/share/lua/5.1',
        }
      },
      telemetry = {
        enable = false,
      },
    }
  },
  capabilities = capabilities
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'bashls', 'html', 'cssls', 'jsonls', 'tsserver', 'tailwindcss' } --, 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = custom_on_attach,
    capabilities = capabilities
  }
end

-- snippet
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

