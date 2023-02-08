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
-- integrate mappings from ultisnip to cmp
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(
        function(fallback)
            cmp_ultisnips_mappings.compose { "expand", "jump_forwards" }(fallback)
        end
    ),
    ["<S-Tab>"] = cmp.mapping(
        function(fallback)
            cmp_ultisnips_mappings.compose { "jump_backwards" }(fallback)
        end
    )
  }),
  sources = cmp.config.sources({
    { name = 'ultisnips' }, -- For ultisnips users.
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

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'bashls', 'html', 'cssls', 'jsonls', 'tailwindcss', 'svelte', 'ccls', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspc[lsp].setup {
    capabilities = capabilities
  }
end

-- lang server that require particular config
lspc.denols.setup {
  root_dir = lspc.util.root_pattern("deno.json"),
  init_options = {
    lint = true,
  },
  capabilities = capabilities
}

lspc.tsserver.setup {
  root_dir = lspc.util.root_pattern("package.json"),
  init_options = {
    lint = true,
  },
  capabilities = capabilities
}
