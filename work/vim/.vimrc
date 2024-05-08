set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.dev/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdcommenter'
Plugin 'elmcast/elm-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'hashivim/vim-terraform'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'valloric/youcompleteme'
Plugin 'fatih/vim-go'
Plugin 'yggdroot/indentline'
Plugin 'elzr/vim-json'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'jxnblk/vim-mdx-js'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set tabstop=4
set shiftwidth=4
set expandtab

" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"

" Configs for Gruvbox
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" Configs for NERD commentor
"
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" enable sytnax highlighting
syntax on

" sets line number
set number

" Changes splitting to make sense
set splitbelow
set splitright

" See more lines when at end of file
set scrolloff=5

" Searching highlights word
set incsearch

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Strip whitespace after write
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * call <SID>StripTrailingWhitespaces()

" For elm formatting
let g:elm_format_autosave = 1
set encoding=utf-8

" For NERDtree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1


" For terraform formatting
let g:terraform_align = 1
" let g:terraform_fold_sections = 1
let g:terraform_fmt_on_save = 1

" For quickly toggling shell
map <C-t> :term<CR>

" For YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" For LineIndents
let g:indentLine_char = '⦙'
let g:indentLine_concealcursor=""

" For fzf
let g:fzf_layout = { 'down': '~40%' }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
" Customize fzf colors to match your color scheme

" Change swap file location
set directory=$HOME/.vim/swapfiles//

" For quickly toggling fzf
map <C-g> :GFiles<CR>

" For quickly toggling fzf
map <C-f> :Files<CR>

" For quickly toggling ripgrep
map <C-p> :Rg<CR>

" change leader
map <Space> <Leader>

" Remap control+c per guidance online
map <C-c> <Esc>
