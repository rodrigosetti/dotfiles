colorscheme molokai

set fuoptions=maxvert,maxhorz
set colorcolumn=80
hi ColorColumn guibg=#222
set gfn=Inconsolata:h24

if has("gui_macvim")
    set guioptions-=T
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    map <D-b> :CommandTBuffer<CR>
endif

