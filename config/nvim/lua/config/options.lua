vim.g.autoformat = true

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.markdown_recommended_style = 0

--vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 3
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.syntax = "ON"
vim.opt.compatible = false
vim.opt.autowrite = true
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 3
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.laststatus = 3
vim.opt.list = false
vim.opt.mouse = "a"
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true
vim.opt.fileencoding = "utf-8"
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
--vim.opt.guifont = "0xProto:h17"
--vim.opt.guifont = "MesloLGS Nerd Font Mono:h17"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5
vim.opt.foldlevel = 99

if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.smoothscroll = true
end

vim.cmd("set wildmenu")
vim.cmd("filetype plugin on")

if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.foldmethod = "expr"
else
  vim.opt.foldmethod = "indent"
end
