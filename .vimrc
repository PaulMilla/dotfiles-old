" Map easier tab nagivation keys
nnoremap <S-h> gT
nnoremap <S-l> gt

" Map Shft+J/K to Scroll
nnoremap <S-j> <C-e>
nnoremap <S-k> <C-y>

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>

" Set Ctrl-W to always delete the previous word, even over line breaks
set backspace=indent,eol,start
set iskeyword-=_

" Make backspace work as expected even in command mode
nnoremap <bs> X

" Jump to search word as you type
set incsearch

" Highlight searches by default
set hlsearch