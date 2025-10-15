vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.diagnostic.config({
  virtual_text  = true,
  severity_sort = true,
  float = {
    style  = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN]  = '▲',
      [vim.diagnostic.severity.HINT]  = '⚑',
      [vim.diagnostic.severity.INFO]  = '»',
    },
  },
})
-- put early in lsp.lua
local orig = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts            = opts or {}
  opts.border     = opts.border or 'rounded'
  opts.max_width  = opts.max_width or 80
  opts.max_height = opts.max_height or 24
  opts.wrap       = opts.wrap ~= false
  return orig(contents, syntax, opts, ...)
end

-- 4) Per-buffer behavior on LSP attach (keymaps, auto-format, completion)
-- See :help LspAttach for the recommended pattern
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
  local buf = args.buf
  local map = function(mode, lhs, rhs, opts) vim.keymap.set(mode, lhs, rhs, opts, { buffer = buf }) end

    -- Keymaps (use builtin LSP buffer functions)
    map('n', 'gD', vim.lsp.buf.declaration)
    map('n', 'gs', vim.lsp.buf.signature_help)
    map('n', 'gl', vim.diagnostic.open_float)
    map('n', 'rn', vim.lsp.buf.rename)

    map('n', 'gd', function()
      require('telescope.builtin').lsp_definitions() end,
      { desc = "Goto Definition" })

    map('n', 'gr', function()
      require('telescope.builtin').lsp_references() end,
      { desc = "Goto References" })

    map('n', 'gi', function()
      require('telescope.builtin').lsp_implementations() end,
      { desc = "Goto Implementation" })

    map('n', 'gt', function()
      require('telescope.builtin').lsp_type_definitions() end,
      { desc = "Goto Type Definition" })
  end,
})

-- 5) Define the Lua language server config (no mason/lspconfig)
-- See :help lsp-new-config and :help vim.lsp.config()
vim.lsp.config['luals'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  settings = {
    Lua = {
      -- runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      -- workspace = {
	-- checkThirdParty = false,
	-- library = vim.api.nvim_get_runtime_file('', true),
      -- },
      telemetry = { enable = false },
    },
  },
}

vim.lsp.enable('luals')
