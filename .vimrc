" --------------------------------------------- Vundle / Plugins ---------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-classpath'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ------------------------------------------------ General ---------------------------------------------------
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

syntax on

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
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

set history=1000                  " longer history
set hidden " This allows vim to put buffers in the bg without saving, and then allows undoes when you fg them.
set tabstop=2                     " 2 space tabs, all the time
let &softtabstop=&tabstop
let &shiftwidth=&tabstop
set expandtab
set smarttab
set smartindent                   " add indentation for code
set autoindent                    " continue indentation
set backspace=indent,eol,start    " make backspace work correctly
set incsearch                     " perform search as you type
set nohlsearch                    " don't highlight search results
set scrolloff=5                   " scroll when 5 lines away from edge of screen
set ignorecase                    " ignore case when searching...
set smartcase                     " ...unless a capital letter was typed
set showmatch                     " show matching brace when closed
set autoread                      " reload changed files when focus returns
set modeline                      " enable modelines
set number                        " show line numbers
set ruler                         " show cursor position, etc.
set cursorline
set showcmd                       " display commands in progress at the bottom
set cmdheight=1
set laststatus=2                  " show statusline with filename
set wildmenu                      " command tab completion menu
set wildmode=list:longest,full    " command tab completion menu options
set completeopt=longest,menuone   " popup menu completion options
set list listchars=trail:.,tab:>. " highlight trailing whitespace
set tags=tags;/                   " Search all directories for tags file
set nobackup                      " don't save backup files
set nowritebackup                 " don't save backup files
set noswapfile                    " don't create .swp files
set foldlevel=99                  " open all folds by default


" ----------------------------------------- Colorscheme and Highlights ---------------------------------------

set background=dark
colorscheme base16-chalk
if exists("+colorcolumn") " use colorcolumn if supported
  let &colorcolumn = 111
  hi ColorColumn ctermbg=DarkGray guibg=gray15
endif

" Better git diff colors
hi diffAdded ctermfg=DarkGreen ctermbg=Black
hi diffRemoved ctermfg=DarkRed ctermbg=Black
hi diffFile ctermfg=darkcyan ctermbg=Black

" Cursor line highlight
hi CursorLine cterm=NONE ctermbg=NONE guibg=gray20

" -------------------------------------------- Auto Commands -------------------------------------------------

" Strip trailing whitespace on save
augroup trailing_whitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup end

" Restore cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup restore_cursor
  autocmd!
  autocmd BufReadPost * call ResCur()
augroup end

augroup rainbow_parentheses
  autocmd!
  autocmd Filetype clojure RainbowParenthesesActivate
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
augroup end

" ----------------------------------------------- Mappings ---------------------------------------------------

let mapleader=","

" treat moving vertically on a wrapped line as two different lines
nnoremap j gj
nnoremap k gk

" custom shortcuts
nnoremap <LEADER>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <LEADER>tl :TagbarToggle<CR>
nnoremap <LEADER>tt :NERDTreeToggle<CR>


" ------------------------------------------ Global Plugin Options -------------------------------------------
" (rainbow_parentheses)
let g:rbpt_max = 10
let g:rbpt_colorpairs = [
    \ ['gray',      'HotPink1'],
    \ ['darkred',   'cyan1'],
    \ ['darkcyan',  'brown1'],
    \ ['darkgreen', 'yellow1'],
    \ ['darkblue',  'MediumOrchid'],
    \ ['gray',      'DeepSkyBlue1'],
    \ ['darkred',   'DarkOrange1'],
    \ ['darkcyan',  'LimeGreen'],
    \ ['darkgreen', 'goldenrod1'],
    \ ['darkblue',  'RoyalBlue1'],
    \ ]

" (tagbar)
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide

" (nerdtree)
let g:NERDTreeChDirMode=2                           " change pwd when NERDTree root changes
let g:NERDChristmasTree=1                           " more colorful NERDTree

" (ctrlp)
let g:ctrlp_map = '<LEADER>f'
let g:ctrlp_working_path_mode=2 " Search for files in repository with CtrlP
let g:ctrlp_custom_ignore = '\.git$\|\.DS_Store$\|.*\.class$'

" ---------------------------------------- Language-Specific Options -----------------------------------------

" -- Clojure --
augroup clojure
  autocmd!
  autocmd FileType clojure nnoremap <buffer> <LEADER>e :%Eval<CR>
  autocmd FileType clojure nnoremap <buffer> <LEADER>E :Eval<CR>
  autocmd FileType clojure nnoremap <buffer> <LEADER>F :CljFmt<CR>
  autocmd FileType clojure setlocal omnifunc=fireplace#omnicomplete
augroup END

let g:ycm_semantic_triggers = {'clojure': ['(']}

" indentation
let g:clojure_align_multiline_strings = 0
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = "with.*,def.*,let.*,send.*"
let g:clojure_fuzzy_indent_patterns .= ",GET,POST,PUT,PATCH,DELETE,context"   " Compojure
let g:clojure_fuzzy_indent_patterns .= ",clone-for"                           " Enlive
let g:clojure_fuzzy_indent_patterns .= ",select,insert,update,delete,with.*"  " Korma
let g:clojure_fuzzy_indent_patterns .= ",fact,facts"                          " Midje
let g:clojure_fuzzy_indent_patterns .= ",up,down,table"                       " Lobos
let g:clojure_fuzzy_indent_patterns .= ",entity"                              " Custom
let g:clojure_fuzzy_indent_patterns .= ",check"                               " Custom

" -- Coffeescript --
augroup coffeescript
  autocmd!
  autocmd FileType coffeescript vnoremap <buffer> <LEADER>m :CoffeeCompile {20}<CR>
augroup END

" (tagbar)
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
