set nocompatible        " Use Vim defaults (much better!)
filetype off            " required!

if has("gui_running")
  set guioptions-=m     " remove menu bar
  set guioptions-=T     " remove toolbar
  set guioptions-=r     " remove scroll bar
endif

if !has("unix")
  " Vundle on Windows
  " Set the runtime path to include Vundle and initialize
  set rtp+=$HOME/.vim/bundle/Vundle.vim/
  "let path='~/.vim/bundle'
  call vundle#begin()
  
  set encoding=utf-8 " Fix ugly characters on menu and welcome screen
else
  " Modify for unix environment
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Must have plugins!
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig-vim'

" Sublime-style multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Web stuff
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax.git'
Plugin 'skammer/vim-css-color.git'
Plugin 'groenewege/vim-less'

" Python
Plugin 'python.vim'

" Markdown
Plugin 'tpope/vim-markdown.git'

" Git
Plugin 'tpope/vim-fugitive'

" Color theme
Plugin 'tpope/vim-vividchalk.git'

call vundle#end()             " required!
filetype plugin indent on     " required!

set t_Co=256            " 256 color mode in term
set autoread            " ReaLoad a file if was changed outside of Vim
set cc=120              " Highlight column at 120
set wrap                " Enable line wrapping.

" Use intelligent case while searching.
" If search string contains an upper case letter, disable ignorecase.
set smartcase
set incsearch           " Incremental search
set hlsearch            " Higlihts search results

" Identation
set autoindent          " Copy indent from current line when starting a new line
set smarttab            " Add tabs equal to the indentation level
set tabstop=2           " Number of space og a <Tab> character
set softtabstop=2       " Set how many columns vim uses when <Tab> in insert mode
set shiftwidth=2        " Number of spaces use by autoindent
set expandtab           " Pressing <Tab> puts spaces, and < and > for indenting uses psaces

" Commands execute automatically on an event

" Rules to disable expandtab in makefiles and markdown files
autocmd FileType make set noexpandtab nosta
autocmd FileType md set expandtab nosta
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd! bufwritepost cimrc source ~/.vimrc

" Enables mice in terminal vim
set mouse=a
set mousem=popup        " Enable the popup menu.

set splitright          " Split vertically to the right.
set splitbelow          " Split horizontally below.

set number              " show line number
set ru                  " Ruler active

" Wildmenu
set wildmenu

" Complete options (disable preview scratch window)
" set completeopt=menu,menuone,longest
" Limit popup menu height
" set pumheight=15


" Config Airline and status line
let g:smartusline_string_to_highlight = '(%n) %f '
set laststatus=2                               " Seperate lines for state and mode
let g:airline_powerline_fonts=1                " Powerline simbols. Hermit font support it
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
"let g:airline_left_sep='?'                    " If we use a font without support of powerline simbols
"let g:airline_right_sep=''
set showmode            " Show current mode in the status line.
set showcmd             " Show the command in the status line.

" Try to use SourceCodePro font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Hermit\ Medium\ 10
  elseif has("gui_photon")
    set guifont=Hermit:s10
  elseif has("gui_kde")
    set guifont=Hermit/10/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-hermitr-medium-r-normal-*-*-180-*-*-m-*-*
  else
    "set guifont=Hermit:h10:cDEFAULT
    set guifont=Source_Code_Pro:h10:cANSI:qDRAFT
  endif
endif

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/'

" Color theme
colors vividchalk

" Enable indent guides on boot and allow colorschemes to style them.
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg='#202020' ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#101010'

" Syntastic
syntax on
set ofu=syntaxcomplete#Complete
let g:syntastic_mode_map={ 'mode': 'active',
\ 'active_filetypes': [],
\ 'passive_filetypes': ['html', 'cpp'] }
let g:syntastic_check_on_open=1

" Trailing spaces stuff
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Butterfly mode (xkcd 378)
if !exists(":Butterfly")
  :command Butterfly :echo "amazing physics is going on"
endif

" Windows fix
if !has("unix")
  " backspace and cursor keys wrap to previous/next line
  set backspace=indent,eol,start whichwrap+=<,>,[,
endif

if has("gui_running")
  " FAQ for terryma/vim-multiple-cursors
  set selection=inclusive
endif
