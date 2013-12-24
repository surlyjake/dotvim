""""""""""""""""" These lines are needed for the pathogen plugin to work """""""""""""""""
runtime bundle/pathogen/autoload/pathogen.vim	" loads pathogen from bundle folder.	""
call pathogen#incubate()			" fires up incubate. loads plugis	""
call pathogen#helptags()			" generates helptags for plugins	""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hidden		" allows file to be have unsaved changes AND not be visible
set number		" turn on line numbers
set vb t_vb=		" visual bell. no flashing
set ts=8		" tabstop. tab equals X spaces
set sts=8		" tabs equal X spaces when editing
set sw=8		" each autointent level is X spaces
set noexpandtab		" use tabs instead of spaces

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

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " If I just wrote a file called '.vimrc', apply the changes
  autocmd bufwritepost vimrc source $MYVIMRC
  autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd bufwritepost _vimrc source $MYVIMRC

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	exe "normal! g`\"" |
	\ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
