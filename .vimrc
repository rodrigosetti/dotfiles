
set nocompatible
set modelines=2

"-- Vim UI --
set laststatus=2 " always show the status line
set list " we do what to show tabs, to ensure we get them out of my files
set listchars=tab:»\ ,trail:· " show tabs and trailing
set numberwidth=3 " We are good up to 99999 lines
set novisualbell " don't blink
set report=0 " tell us when anything is changed via :...
set showmatch " show matching brackets
set so=5      " minimal number of context lines
set cursorline     " Highlight current editing line
hi CursorLine cterm=NONE ctermbg=darkgray
syntax on

if exists( '&colorcolumn' )
    hi ColorColumn ctermbg=black guibg=black
    set colorcolumn=80
endif

"-- Tweaks --
"Add tweak for better backspace support
set backspace=indent,eol,start

set textwidth=0

set undolevels=1000
set showmode
set pastetoggle=<F11>
set formatoptions=cnoqr
set smartcase
set ignorecase
set laststatus=2
set encoding=utf-8
set scrolloff=5
set autoindent
set incsearch
set hlsearch
set complete=.,w,b,u,U,t,i,d
set number

"-- Filename autocomplete --
set wildmode=longest:list,full
set wildignore=*.o,*.pyc
set wildmenu

"-- Backup --
set backup " make backup files
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/tmp " directory to place swap files in

"-- Programming --
set fileformats=unix,dos,mac " support all three, in this order
set iskeyword+=_,$,@,%,# " none of these are word dividers

"-- Spaces/Tabs --
set expandtab "Use spaces instead of tabs
set shiftwidth=4
set tabstop=4
set softtabstop=5

" Alternative using Tab/Shift-Tab (for gvim).
:vnoremap <Tab> >gv
:vnoremap <S-Tab> <gv
:vnoremap > >gv
:vnoremap < <gv

filetype plugin indent on

if has("vertsplit")
  set cmdwinheight=10
endif

if has("statusline")
  set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
  "              | | | | |  |   |      |  |     |    |
  "              | | | | |  |   |      |  |     |    + current
  "              | | | | |  |   |      |  |     |       column
  "              | | | | |  |   |      |  |     +-- current line
  "              | | | | |  |   |      |  +-- current % into file
  "              | | | | |  |   |      +-- current syntax in
  "              | | | | |  |   |          square brackets
  "              | | | | |  |   +-- current fileformat
  "              | | | | |  +-- number of lines
  "              | | | | +-- preview flag in square brackets
  "              | | | +-- help flag in square brackets
  "              | | +-- readonly flag in square brackets
  "              | +-- modified flag in square brackets
  "              +-- full path to file in the buffer
endif

if has("cmdline_info")
  set showcmd " show the command being typed
  set ruler
endif

if has("cmdline_hist")
  set history=100
endif

if has("linebreak")
  set linebreak
  set sbr=▸\
  set showtabline=2
endif

if has("folding")
  set foldmethod=indent
  set foldlevelstart=20
endif

if has("localmap")
  nmap <unique> <silent> <Leader>a :w %<CR> :!aspell -c %<CR> :e! %<CR>
  nmap <unique> <silent> <Leader>s :syn sync fromstart<CR>
  nmap <unique> <silent> <S-A-h> :execute TabMoveRW()<CR>
  nmap <unique> <silent> <S-A-l> :execute TabMoveFW()<CR>
  nmap <unique> <silent> <S-h> :tabprev<CR>
  nmap <unique> <silent> <S-l> :tabnext<CR>
  nmap <unique> <silent> <A-t> :tabnew<CR>
  nmap <unique> <silent> <A-w> :bd<CR>
  nmap <unique> <silent> <A-S-w> :close<CR>
  nmap <unique> <silent> <F5> :prev<CR>
  nmap <unique> <silent> <F6> :next<CR>
  nmap <unique> <silent> <F3> :nohl<CR>
  nmap <unique> <silent> <Leader>t :CommandT<CR>
  nmap <unique> <silent> <Leader>b :BufExplorer<CR>
  nmap <unique> <silent> <unique> <Leader>be :BufExplorer<CR>

  nmap <unique> <silent> <C-p> :FufFile<CR>
endif

if has("wildignore")
    set wildignore+=*.o,*.obj,*.pyc,*.orig,*.swp,.git,*.toc,*.aux,*.out,*.snm,*.nav
endif

if has("windows") && v:version >= 700
  function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
      " select the highlighting
      if i + 1 == tabpagenr()
        let s .= '%#TabLineSel#'
      else
        let s .= '%#TabLine#'
      endif

      " set the tab page number (for mouse clicks)
      let s .= '%' . (i + 1) . 'T'

      " the label is made by MyTabLabel()
      let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    "if tabpagenr('$') > 1 let s .= '%=%#TabLine#%999Xclose' endif

    return s
  endfunction

  function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let s = substitute((bufname(buflist[winnr - 1])), '.*/', '', '')
    if (empty(s))
      let s = '[No Name]'
    endif
    let s = s . ' ['. bufnr(buflist[winnr-1]) .']'
    return(s)
  endfunction

  set tabline=%!MyTabLine()

  function TabMoveFW()
    if (tabpagenr() == tabpagenr('$'))
      :execute "tabmove 0"
    else
      :execute "tabmove ". tabpagenr()
    endif
  endfunction

  function TabMoveRW()
    if (tabpagenr() < 2)
      :execute "tabmove"
    else
      :execute "tabmove ". (tabpagenr()-2)
    endif
  endfunction
endif

if has("printer")
  set printoptions=paper:A4,syntax:y,number:n,wrap:y
  set printfont=Bitstream\ Vera\ Sans\ Mono\ 14
endif

nnoremap <leader><space> :noh<cr>

:filetype plugin on

" Removes all extra spaces from lines
command -range StripRight silent! <line1>,<line2>s/\s\+$//

