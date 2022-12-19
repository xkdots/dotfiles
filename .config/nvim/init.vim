"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath=&runtimepath
"source ~/.vimrc

" inspiration
" https://github.com/ThePrimeagen/.dotfiles/blob/ca41b9e81a131cc0ac414d26d6703b5c21fd143a/nvim/.config/nvim/init.vim
" https://github.com/joshmedeski/dotfiles/blob/main/mackup/.config/nvim/init.vim
" then source xkt.vim
" then scripts for tmux
" https://github.com/joshmedeski/dotfiles/tree/main/mackup/.config/bin

" Options
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set cc=80 " Show at 80 column a border for good code style
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim

call plug#begin()
source $HOME/.config/nvim/nvim-config/plugins.vim
call plug#end()

source $HOME/.config/nvim/nvim-config/general.vim

source $HOME/.config/nvim/nvim-config/init.lua
source $HOME/.config/nvim/nvim-config/lualine.lua
source $HOME/.config/nvim/nvim-config/nvim-treesitter.lua

source $HOME/.config/nvim/nvim-config/abbreviations.vim
source $HOME/.config/nvim/nvim-config/coc.vim
source $HOME/.config/nvim/nvim-config/goyo.vim
source $HOME/.config/nvim/nvim-config/vim-test.vim

source $HOME/.config/nvim/nvim-config/leader.vim
source $HOME/.config/nvim/nvim-config/theme.vim

" Miscellaneous
let g:python3_host_prog='/opt/homebrew/bin/python3'

command! LF FloatermNew lf
let g:airline#extensions#tabline#enabled=1
let g:vim_markdown_folding_disabled = 1

let g:rooter_patterns = ['.git']

" lf Config
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory
let g:lf_width = 0.9
let g:lf_height = 0.7

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

" plugin config
let g:startify_files_number = 50
let g:startify_disable_at_vimenter = 1
let g:startify_custom_header = []

" TODO make filename match work but in another plugin
" set -g @fzf-url-extra-filter 'grep -oE "^(.+)\/([^\/]+)$"'

nnoremap ,e :Startify<cr>
" nnoremap ,z :History<cr>

source ~/.xkt.vim


