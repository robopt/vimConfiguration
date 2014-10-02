set t_Co=256

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/home/emead/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$HOME/.vim/bundle'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'majutsushi/tagbar'
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'luochen1990/rainbow'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jcf/vim-latex'
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"


colorscheme Tomorrow-Night
"colorscheme skittles_dark
call pathogen#incubate()
filetype off
syntax on
execute pathogen#infect()
filetype plugin indent on

set number
set relativenumber

set linebreak
set smartcase
set ignorecase
set incsearch
set autoindent
"set softtabstop=2
set smartindent
set tabstop=4
set shiftwidth=2
set expandtab
"set gdefault
set hlsearch
set omnifunc=syntaxcomplete#Complete
set laststatus=2
let mapleader=","

let g:rainbow_active = 1
let g:rainbow_conf = {
     \    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
     \    'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
      \   'separately' : { '*': {}, 'vim' : {} },
      \   }

let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

" To move up and down logical lines instead of physical lines
" " Instead of changing the Home row keys, use the arrow keys
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
noremap <silent> <Up> gk
noremap <silent> <Down> gj
inoremap <silent> <Up> <C-o>gk
inoremap <silent> <Down> <C-o>gj
" Home and end keys are broken -- dependent of TERM variable;
" Not sure how to fix reliably
noremap <silent> <Home> g<Home>
noremap <silent> <End> g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End> <C-o>g<End>

if isdirectory(expand('$HOME/.cache/vim'))
  if &backupdir =~# '^\.,'
    set backupdir^=$HOME/.cache/vim/backup//
  endif

  if &directory =~# '^\.,'
    set directory^=$HOME/.cache/vim/swap//
  endif

  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    set undodir^=$HOME/.cache/vim/undo//
  endif
endif


" syntastic settings
let g:syntastic_mode_map = { 'mode': 'active' } " syntastic: Active syntax checking
let g:syntastic_check_on_open=1 " syntastic: Immediately check syntax on open

function! SyntasC () " syntastic: C
  let g:syntastic_c_check_header = 1
  let g:syntastic_c_no_include_search = 1
  let g:syntastic_c_auto_refresh_includes = 1
  let g:syntastic_cpp_compiler = 'gcc'
  let g:syntastic_c_compiler_options = ' -Wall -Wextra -pedantic -g -ggdb -std=c99'
  "let g:syntastic_c_compiler = 'clang'
  "let g:syntastic_c_compiler_options = ' -Weverything -g -std=c99'
endfunction

function! SyntasCPP () " syntastic: C++
  let g:syntastic_cpp_check_header = 1
  let g:syntastic_cpp_no_include_search = 1
  let g:syntastic_cpp_auto_refresh_includes = 1
  let g:syntastic_cpp_compiler = 'g++'
  let g:syntastic_cpp_compiler_options = ' -Wall -Wextra -pedantic -g -ggdb -std=c++0x'
  "let g:syntastic_cpp_compiler = 'clang++'
  "let g:syntastic_cpp_compiler_options = ' -Weverything -g -std=c++0x'
endfunction


function! SyntasJAVA () " syntastic: JAVA
  let g:syntastic_java_check_header = 1
  let g:syntastic_java_no_include_search = 1
  let g:syntastic_java_auto_refresh_includes = 1
  let g:syntastic_java_compiler = 'javac'
  let g:syntastic_java_compiler_options = ' -classpath ../../:gobbletclient.jar Player/Player1/Player1.java'
  "let g:syntastic_cpp_compiler = 'clang++'
  "let g:syntastic_cpp_compiler_options = ' -Weverything -g -std=c++0x'
endfunction


"the separator used on the left side >
let g:airline_left_sep='>'
"the separator used on the right side >
let g:airline_right_sep='<'
"enable modified detection >
let g:airline_detect_modified=1
"enable paste detection >
let g:airline_detect_paste=1
"enable iminsert detection >
let g:airline_detect_iminsert=0
"determine whether inactive windows should have the left section collapsed to
"only the filename of that buffer.  >
let g:airline_inactive_collapse=1
"themes are automatically selected based on the matching colorscheme. this
"can be overridden by defining a value. >
"let g:airline_theme=
"if you want to patch the airline theme before it gets applied, you can
"supply the name of a function where you can modify the palette. >
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'badwolf'
    for colors in values(a:palette.inactive)
      let colors[3] = 245
    endfor
  endif
endfunction
"enable/disable automatic population of the `g:airline_symbols` dictionary
"with powerline symbols. >
let g:airline_powerline_fonts=0
"define the set of text to display for each mode.  >
let g:airline_mode_map = {} " see source for the defaults
"or copy paste the following into your vimrc for shortform text
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

"define the set of filename match queries which excludes a window from having
"its statusline modified >
let g:airline_exclude_filenames = [] " see source for current list
"define the set of filetypes which are excluded from having its window
"statusline modified >
let g:airline_exclude_filetypes = [] " see source for current list
"defines whether the preview window should be excluded from have its window
"statusline modified (may help with plugins which use the preview window
"heavily) >
let g:airline_exclude_preview = 0
let g:rainbow_conf = {
      \    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \    'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan'],
      \    'operators': '_,_',
      \    'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
      \    'separately': {
      \        '*': {},
      \        'lisp': {
      \            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \            'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
      \        },
      \        'vim': {
      \            'parentheses': [['fu\w* \s*.*)','endfu\w*'], ['for','endfor'], ['while', 'endwhile'], ['if','_elseif\|else_','endif'], ['(',')'], ['\[','\]'], ['{','}']],
      \        },
      \        'tex': {
      \            'parentheses': [['(',')'], ['\[','\]'], ['\\begin{.*}','\\end{.*}']],
      \        },
      \        'css': 0,
      \        'stylus': 0,
      \    }
      \}
