require('plugins')

-- Settings
local opt = vim.opt
opt.textwidth = 80
opt.scrolloff = 7
opt.wildignore = { '*.o', '*~', '*.pyc' }
opt.wildmode = 'longest,full'
opt.whichwrap:append '<,>,h,l'
opt.inccommand = 'nosplit'
opt.lazyredraw = true
opt.showmatch = true
opt.ignorecase = false
opt.smartcase = false
opt.tabstop = 2
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 2
opt.number = true
opt.smartindent = true
opt.laststatus = 3
opt.showmode = false
opt.shada = [['20,<50,s10,h,/100]]
opt.hidden = true
opt.shortmess:append 'c'
opt.joinspaces = false
opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]
opt.updatetime = 100
opt.conceallevel = 2
opt.concealcursor = 'nc'
opt.previewheight = 5
opt.undofile = true
opt.synmaxcol = 500
opt.display = 'msgsep'
opt.modeline = false
opt.mouse = 'nivh'
opt.signcolumn = 'yes:1'

vim.cmd([[
colorscheme codedark
autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights()
]])

require('lualine').setup()

