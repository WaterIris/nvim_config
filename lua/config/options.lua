--line nums
vim.opt.relativenumber = true
vim.opt.number = true

-- indentation and tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = true

-- cursor line
vim.opt.cursorline = true

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- undo dir settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false

-- faster cursor hold
vim.opt.updatetime = 50

