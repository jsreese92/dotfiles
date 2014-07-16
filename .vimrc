" to fold/unfold: za

" General Options {{{1

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


"1}}}


" Tells vim to ignore case in searches, unless you specify case
set ignorecase
set smartcase

" Ctags and taglist stuff {{{1

" search current directory for tags and work towards root until one is found
set tags=./tags;/
" open definition in a new tab with ctrl+\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" open definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" 1}}}

"change default colorscheme
colorscheme zenburn

" 80 character column support
" set cc=80

"so screen likes 256 colors in vim
set t_Co=256

"Puts line number on the side by default
set number

" When vim closes unexpectedly, those annoying .swp files go here 
" instead of the directory in which you're working
set directory=~/.vim/swp

" Similar to the above, when editing a file with vim, it sometimes
" makes a backup of the file, which has the same name followed by ~
" This puts all these files in a folder to avoid cluttering
set backupdir=~/.vim/backup

"Gives syntax highlighting to .siml files
au BufRead,BufNewFile *.siml set filetype=xml

"Sets bash-like file completion in vim
set wildmode=longest,list,full
set ls=2

"Maps full page up and down to u and d
map <C-d> <C-f>
map <C-u> <C-b>

"Makes tab switch between split windows
set autochdir
map <Tab> <C-W>W:cd %:p:h<CR>:<CR>

"Makes tabs 2 spaces
set expandtab
set tabstop=2
set sw=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" vim:fdm=marker
