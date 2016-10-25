"Settings
set number 
set hidden
set clipboard=unnamed
set noswapfile
set backupdir=~/.vim/backup/
set undodir=~/.vim/undo/
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set mouse=a
set expandtab 
set tabstop=2
set softtabstop=2
set shiftwidth=2
set scrolloff=5
set colorcolumn=80
set synmaxcol=120
set background=light
set langmenu=en_US
set pumheight=15
set hlsearch
set lazyredraw
set ttyfast
filetype plugin indent on
syntax enable 

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'mhinz/vim-signify'
Plug 'tomtom/tcomment_vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-obsession'
Plug 'SirVer/ultisnips'
Plug 'othree/yajs'
Plug 'othree/es.next.syntax.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mustache/vim-mustache-handlebars'
Plug 'maralla/validator.vim'
Plug 'chriskempson/base16-vim'
Plug 'fatih/vim-go'
call plug#end()

let base16colorspace=256
colorscheme base16-github
let g:airline_theme='base16'
let mapleader="\<Space>"
set completeopt-=preview

"Remove tailing whitespace at buffer write
autocmd BufWritePre *.js :%s/\s\+$//e

" IME Change when exit insert mode
if has('mac') && filereadable('/usr/local/lib/libInputSourceSwitcher.dylib')
  autocmd InsertLeave * call libcall('/usr/local/lib/libInputSourceSwitcher.dylib', 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.ABC')
endif

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

"PLUGIN SETTINGS

"Ultisnip
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#left_alt_sep='|'

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

"CtrlP
let g:ctrlp_show_hidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
            \ 'dir':  '.svn\|.git\|dist\|doc\|bower_components\|coverage\|node_modules\|report',
            \ 'file': '\v\.(DS_Store|exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
nmap <leader>m :CtrlPModified<cr>

"JSX
let g:jsx_ext_required=0

"Validator
let g:validator_javascript_checkers=['eslint']
let g:validator_filetype_map={'javascript.jsx': 'javascript'}
let g:validator_warning_symbol='✓'
let g:validator_error_symbol='✗'
highlight ValidatorErrorSign ctermbg=18 ctermfg=09
highlight ValidatorWarningSign ctermbg=18 ctermfg=12
