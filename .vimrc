"   _        _          _         _   _         _           _      
" /\ \    _ / /\      /\ \      /\_\/\_\ _    /\ \        /\ \     
" \ \ \  /_/ / /      \ \ \    / / / / //\_\ /  \ \      /  \ \    
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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'ghifarit53/tokyonight-vim'

call plug#end()


""" Basic settings
syntax on

" config searching
set nohlsearch	" dont highlight search result
set incsearch	" shows matches when you type 
set ignorecase	" lower or uppercase mathces 

" relarive lien number and cursorline
" relative line number and sursorline
set relativenumber	" relative numbers 	
"set cursorline		" highlight the tct line of the cursor 

" format tab etc
set autoindent			" apply identation to the next line while in insert mode or with o and O
set smartindent	    	" reacts to the syntax/style	 
set tabstop=4			" number of spaces that <tab> counts for 
set softtabstop=4
set expandtab			" spaces are used in indents 
set shiftwidth=4
set nowrap				" lines that are longer will not be wraped and continued in a new line

" fileselection
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


colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1  " let sneak use ignorecase

""" CoC Settings from github 
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


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


