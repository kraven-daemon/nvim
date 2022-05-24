-- Lsp, comple and snippet
--
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- https://github.com/sumneko/lua-language-server
-- luasnip

-- Lsp
local lspc = require('lspconfig')
-- nvim-cmp
local cmp = require('cmp');
-- snippets
local luasnip = require('luasnip')

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- bind capabilities to servers consigurations
local servers = { 'bashls', 'html', 'cssls', 'jsonls', 'tailwindcss', 'svelte', 'ccls', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspc[lsp].setup {
    capabilities = capabilities
  }
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- luasnip
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- tab is now select/expand/jump - tabbing all day
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
    end
  }),
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },

  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})



-- Custom setup : sumneko_lua, denols and tsserver
local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h')
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "?/.lua")
table.insert(runtime_path, "init.lua")
table.insert(runtime_path, "./lua/?.lua")
table.insert(runtime_path, "./lua/?/init.lua")


lspc.sumneko_lua.setup {
    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
          workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
          },
          runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              pathStrict = false,
              -- Setup your lua path
              path = runtime_path,
          },
          diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
              enable = false,
          },
      },
    },
  capabilities = capabilities
}

lspc.denols.setup {
  root_dir = lspc.util.root_pattern("deno.json"),
  init_options = {
    lint = true,
  },
}

lspc.tsserver.setup {
  root_dir = lspc.util.root_pattern("package.json"),
  init_options = {
    lint = true,
  },
}
