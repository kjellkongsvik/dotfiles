if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Fish doesn't play all that well with others
set shell=/bin/bash
let mapleader = "\<Space>"

set tabstop=4
set number
set laststatus=2
set mouse=a
set clipboard=unnamedplus
set background=dark
set noswapfile
set backspace=indent,eol,start

":highlight CursorColumn ctermbg=DarkGrey cterm=bold term=bold

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.7' }
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
call plug#end()

colorscheme jellybeans

let g:airline#extensions#tabline#enabled = 1
set t_Co=256
let g:go_fmt_autosave=0

" Quick-save
nmap <leader>w :w<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

nnoremap <C-b> :<C-u>NERDTreeToggle<CR>
nnoremap <leader>f :<C-u>GFiles<CR>

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

let g:ctrlp_user_command = 'fd --type f -H --color never "" %s'

command! BufOnly silent! execute "%bd|e#|bd#"

" Prevent entering replace mode
imap <Insert> <Nop>
inoremap <S-Insert> <Insert>

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

nmap gd :LspDefinition<CR>
nmap gr :LspReferences<CR>
nmap gi :LspImplementation<CR>
nmap gt :LspTypeDefinition<CR>
nmap <leader>rn :LspRename<CR>
nmap [g <plug>(lsp-previous-diagnostic)
nmap ]g <plug>(lsp-next-diagnostic)
nmap K :LspHover<CR>

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
imap <c-@> <Plug>(asyncomplete_force_refresh)
let g:asyncomplete_auto_popup = 0
