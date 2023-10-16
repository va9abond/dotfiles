vim.opt.encoding = "utf-8"

vim.g.XkbSwitchEnabled = 1
vim.g.XkbSwitchIMappings = { 'ru' }

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.completeopt = 'menuone,noselect'

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cindent = true
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.breakindent = true

vim.opt.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hidden = true

vim.o.autowrite = true
vim.o.autoread = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 9
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.isfname:append("@-@")
vim.opt.list = true

vim.opt.updatetime = 200
vim.opt.timeoutlen = 9999
vim.opt.history = 100

vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0
vim.g.load_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
