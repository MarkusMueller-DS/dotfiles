"   _        _          _         _   _         _           _      
" /\ \    _ / /\      /\ \      /\_\/\_\ _    /\ \        /\ \     
" \ \ \  /_/ / /      P\ \ \    / / / / //\_\ /  \ \      /  \ \    
"  \ \ \ \___\/       /\ \_\  /\ \/ \ \/ / // /\ \ \    / /\ \ \   
"  / / /  \ \ \      / /\/_/ /  \____\__/ // / /\ \_\  / / /\ \ \  
"  \ \ \   \_\ \    / / /   / /\/________// / /_/ / / / / /  \ \_\ 
"   \ \ \  / / /   / / /   / / /\/_// / // / /__\/ / / / /    \/_/ 
"    \ \ \/ / /   / / /   / / /    / / // / /_____/ / / /          
"     \ \ \/ /___/ / /__ / / /    / / // / /\ \ \  / / /________   
"      \ \  //\__\/_/___\\/_/    / / // / /  \ \ \/ / /_________\  
"       \_\/ \/_________/        \/_/ \/_/    \_\/\/____________/  
                                                               
" VIMRC @ Markus Müller 

""" Plugins
call plug#begin('~/.vim/plugged')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
Plug 'psliwka/vim-smoothie'
Plug 'lifepillar/vim-mucomplete'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'ghifarit53/tokyonight-vim'

call plug#end()

""" Basic settings
set nocompatible
syntax on

" enable built in autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" configure searching
set hlsearch	" dont highlight search result
set incsearch	" shows matches when you type 
set ignorecase	" lower or uppercase mathces  

" relative lien number and cursorline
set nu              " show actual line number
set relativenumber	" relative numbers 	
set cursorline		" highlight the line of the cursor 

" format tab etc
set autoindent			" apply identation to the next line while in insert mode or with o and O
set smartindent	    	" reacts to the syntax/style	 
set tabstop=4			" number of spaces that <tab> counts for 
set softtabstop=4
set expandtab			" spaces are used in indents 
set shiftwidth=4
set nowrap				" lines that are longer will not be wrap and continued in a new line

" file selection
set wildmenu                    " enhanced command-line complition, possible matches are shown abobe command line
set wildignorecase              " ignore upper or lowercase
set wildmode=list:longest,full  " :h wildmode for more info 

" less clutter but more risk
set noswapfile      " no extra swap file is created when working with buffers 
set nobackup

" misc
set ttyfast			" faster scrolling
set noerrorbells	" no sound error
set scrolloff=3     " minimal number so screen lines to keep above and blow the cursor
set splitbelow      " new split only below
set nocompatible    " relevant for plugins
set history=500
set ruler
set mouse=a
set lazyredraw
set spelllang=en_us
set hidden


colorscheme gruvbox
set background=dark
highlight Normal     ctermbg=NONE 
highlight LineNr     ctermbg=NONE 
highlight SignColumn ctermbg=NONE   
hi SpellBad ctermbg=160


let g:sneak#label = 1
let g:sneak#use_ic_scs = 1  " let sneak use ignorecase

""" Settings for mucomplete
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion messages
let g:mucomplete#enable_auto_at_startup = 1 " activate mucomplete at startup


""" Settings for airline
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2
set noshowmode " mode is not needed anymore
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" change leader to SPACE
let mapleader = " "

" quickly get out of INSERT-Mode
imap jj <ESC>
imap JJ <ESC>

" switch between splits
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" move to first and last char of the line with H and L
nnoremap L $
nnoremap H ^

" keep it centered when searching through a file with n and N
nnoremap n nzzzv
nnoremap N nzzzv

" use äüö to jump around
nnoremap ü {
nnoremap ä }
nnoremap ö ] 

" show hotkeys
nmap <leader>hk :vsplit ~/.vim/hotkeys<return>

" disable recording as i dont use it and i hate if i see it at the cmd line
map q <Nop>

" moving text
nnoremap º :m .+1<CR>==     " º is option + j 
nnoremap ∆ :m .-2<Cr>==     " ∆ is ooption + k

nnoremap <leader>v :e $MYVIMRC<cr>

" toggle spelling visuals with leader s
nnoremap <leader>s :set spell!

" clears highlights
nnoremap // :noh<return>

" toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
