"leader key
let mapleader = " "
"mappings
noremap <space>e :NvimTreeToggle<cr>
nnoremap <leader>nr :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors	"required for colorizer
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'kyazdani42/nvim-web-devicons'	  " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'		  " explorer
Plug 'dracula/vim', { 'as': 'dracula' }	  "color theme

Plug 'norcalli/nvim-colorizer.lua' " highlights colors, e.g. #000000
Plug 'https://github.com/tpope/vim-sleuth'    "finds out what the tab size should be
Plug 'https://github.com/tpope/vim-sensible'  "some basic stuff
Plug 'webdevel/tabulous' "gives tabs numbers

Plug 'vim-python/python-syntax'
Plug 'wellle/context.vim'	" sticky function headers

Plug 'rhysd/conflict-marker.vim'    "git conflig markers
Plug 'lewis6991/gitsigns.nvim'

Plug 'lervag/vimtex'        " Better Latex support

" LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'j-hui/fidget.nvim', { 'tag' : 'legacy'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'simrat39/rust-tools.nvim'

" Initialize plugin system
call plug#end()
:luafile $HOME/.config/nvim/script.lua

colorscheme dracula
let g:python_highlight_all = 1	"enable python syntax

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
set number
syntax on
set background=dark
set guicursor=n-c-v:hor1,i-ci-ve:ver10,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor\,sm:block-blinkwait175-blinkoff150-blinkon175
set cursorline
nnoremap <space><space> :noh<cr>
nnoremap <space>s :%s/\<<C-r><C-w>\>/
"au VimLeave * exercise "!printf '\033[5 q\r'"
" enable usage of mouse
set mouse=a
" set clipboard^=unnamed,unnamedplus
set number relativenumber
au BufRead,BufNewFile *.cairo set filetype=cairo
hi MatchParen ctermbg=none ctermfg=red
hi CursorLine guibg=#22334E
hi Normal guibg=#02131E guifg=#49E2FF

autocmd BufWritePost *.cairo silent ! cairo-format % -i  2> /dev/null
"autocmd FileType python set equalprg=autopep8\ -
autocmd BufWritePost *.py silent ! autopep8 --aggressive --aggressive -i % 


" VIM-LATEX SETUP
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}

function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.log/vim/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction
