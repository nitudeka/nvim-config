local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({
	  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
	  ['<C-Space>'] = cmp.mapping.complete(),
  })
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	  'tsserver',
	  'rust_analyzer'
  },
  handlers = {
    lsp_zero.default_setup,
  },
})
