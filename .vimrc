" folds: to fold/unfold: za, open all: zR, close all: zM

" Use Vim settings, rather than Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" Plugins {{{1

" Pathogen {{{2

execute pathogen#infect()

" from this guy: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
call pathogen#helptags()

" 2}}}

" Ctags and taglist stuff {{{2

" search current directory for tags and work towards root until one is found
set tags=./tags;/

" open definition in a new tab with ctrl+\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" open definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" put Tlist on the right window (Nerd tree on the left)
let Tlist_Use_Right_Window = 1

" 2}}}

" 1}}}

" General Options {{{1

" Formatting {{{2

" Tells vim to ignore case in searches, unless you specify case
set ignorecase
set smartcase

"Sets bash-like file completion in vim
set wildmode=longest,list,full
set ls=2

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

" 2}}}

" Misc {{{2

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" 2}}}

" Color stuff {{{2

"change default colorscheme
colorscheme zenburn

" 80 character column support
" set cc=80

" force 256 colors in vim
set t_Co=256

" 2}}}

" Layout {{{2

"Puts line number on the side by default
set number

" 2}}}

" Backup files {{{2

" When vim closes unexpectedly, those annoying .swp files go here 
" instead of the directory in which you're working
set directory=~/.vim/swp

" Similar to the above, when editing a file with vim, it sometimes
" makes a backup of the file, which has the same name followed by ~
" This puts all these files in a folder to avoid cluttering
set backupdir=~/.vim/backup

" 2}}}


"1}}}

" Settings for other languges {{{1

"Gives syntax highlighting to .siml files
au BufRead,BufNewFile *.siml set filetype=xml

" 1}}}

" Key Mappings {{{1

"Maps full page up and down to u and d
map <C-d> <C-f>
map <C-u> <C-b>

" Change local directory when you change windows in vim
set autochdir

" Makes ctrl-tab switch between split windows. This interferes with TagList, disabling
" map <Tab> <C-W>W:cd %:p:h<CR>:<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" 1}}}

" Syntax highlighting etc. {{{1

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

" 1}}}

" vim:fdm=marker
