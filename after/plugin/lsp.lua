local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp_zero.buffer_autoformat()
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  lsp_zero.default_keymaps({
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  })
end)

lsp_zero.configure("tsserver", {
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end,
})

lsp_zero.configure("volar", {
  filetypes = { "vue" },
})

lsp_zero.setup()

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'rust_analyzer',
    'gopls',
    'volar',
    'templ'
  },
  handlers = {
    lsp_zero.default_setup,
  },
})
