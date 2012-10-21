set nocompatible

autocmd VimEnter * NERDTree

" delete the toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" Quit mvim if NedrTree is the last open window
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

" tab setup
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set colorcolumn=81
set scrolloff=3 " minimum lines to keep above and below cursor

" indent on new line
set autoindent
set smartindent

" setup the leader key
let mapleader = ","

" makes ,w split windows vertically
nnoremap <leader>w <C-w>v<C-w>l

" split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" font
set guifont=Inconsolata:h12

set wrap
set guioptions=aAce

" color scheme
syntax enable
set background=dark
colorscheme solarized

" Turn on line numbers
set number

" Show current position
set ruler

" Set height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Turn off backup
set nobackup
set nowb
set noswapfile

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing spaces on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()
