"Settings
set number 
set hidden
set clipboard=unnamed
set noswapfile
set backupdir=~/.config/nvim/backup/
set undodir=~/.config/nvim/undo/
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set nohlsearch
set mouse=a
set expandtab 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=5
set lazyredraw
set colorcolumn=80
set background=dark
filetype plugin indent on
syntax enable 

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'Shougo/deoplete.nvim'
Plug 'benekastah/neomake'
Plug 'mhinz/vim-signify'
Plug 'tomtom/tcomment_vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-obsession'
Plug 'terryma/vim-multiple-cursors'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mkitt/tabline.vim'
Plug 'MattesGroeger/vim-bookmarks'
" plugins for language specific
Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
call plug#end()

"Setting after plugins are load
let base16colorspace=256
let mapleader="\<Space>"
colorscheme base16-railscasts
set completeopt-=preview

"Change cursor at each mode (command, insert)
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
if exists('$ITERM_PROFILE')
  if exists('$TMUX') 
    let &t_SI="\<Esc>[3 q"
    let &t_EI="\<Esc>[0 q"
  else
    let &t_SI="\<Esc>]50;CursorShape=1\x7"
    let &t_EI="\<Esc>]50;CursorShape=0\x7"
  endif
end

"Shortcuts
ab ㅈ w
ab ㅈㅂ wq
imap jk <esc>
imap ㅓㅏ <esc>
map <C-J> :bprev<CR>
map <C-K> :bnext<CR>
nmap <Leader><Leader> V
nmap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>r :e<CR>

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_alt_sep = '|'

"NERDTree
let NERDTreeIgnore=['\.DS_Store$']
let g:NERDTreeShowHidden=1
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('hbs', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

"TernForVim
let g:tern_show_signature_in_pum = 1

"Deoplete.
let g:deoplete#enable_at_startup=1
let g:deoplete#file#enable_buffer_path=1

"Neomake
let g:neomake_javascript_enabled_makers=['eslint']
autocmd! BufWritePost *.js Neomake

"CtrlP
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
            \ 'dir':  '.svn\|.git\|dist\|doc\|bower_components\|coverage\|node_modules\|report',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
nmap <leader>m :CtrlPModified<cr>

"Typescript for vim
let g:typescript_indent_disable=1
