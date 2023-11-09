vim.opt.encoding = "utf-8"
vim.opt.showcmd = true
-- vim.opt.showmatch = true

-- vim.opt.pumblend = 17
-- vim.opt.wildmode = "longest:full"
-- vim.opt.wildoptions = "pum"

-- vim.g.XkbSwitchEnabled = 1
-- vim.g.XkbSwitchIMappings = { 'ru' }

vim.opt.mouse = "a"

vim.wo.number = true
vim.wo.relativenumber = true

-- vim.opt.completeopt = {"menuone", "noselect", "menu", "preview"}

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

vim.opt.wrap = false
vim.opt.list = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hidden = true

vim.opt.autowrite = true
vim.opt.autoread = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 200
vim.opt.timeoutlen = 1500
vim.opt.history = 100

-- vim.g.cedit = '<C-i>'

-- ---------------------------------------------------------
        -- Disable continuation of comments to the next line
vim.cmd [[set formatoptions-=cro]]
-- ---------------------------------------------------------
                                                    -- netrw
vim.g.netrw_banner = 1
-- vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
-- ---------------------------------------------------------
                                              -- Spell check
vim.g.spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
