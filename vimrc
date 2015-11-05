filetype off

" settings
set number 
set hidden
set clipboard=unnamed
set noswapfile
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//
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

let base16colorspace=256

syntax enable 
set background=dark
colorscheme base16-railscasts

" Change cursor at each mode (command, insert)
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
if exists('$ITERM_PROFILE')
  if exists('$TMUX') 
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

" Vunble settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'marijnh/tern_for_vim'
Plugin 'gavocanov/vim-js-indent'
Plugin 'bling/vim-airline'
Plugin 'msanders/snipmate.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'mhinz/vim-signify'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-obsession'
Plugin 'mkitt/tabline.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'fatih/vim-go'
Plugin 'benekastah/neomake'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'wavded/vim-stylus'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

let mapleader = "\<Space>"

" IME Change when exit insert mode
if has('mac') && filereadable('/usr/local/lib/libInputSourceSwitcher.dylib')
  autocmd InsertLeave * call libcall('/usr/local/lib/libInputSourceSwitcher.dylib', 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.ABC')
endif

" Plugin Configurations

" devicon
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

"vim bookmark
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

" NERDTress File highlighting
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

let NERDTreeIgnore = ['\.DS_Store$']

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_alt_sep = '|'

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost *.js Neomake

" TernForVim
let g:tern_show_signature_in_pum = 1

" CtrlP
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

" NERDTree
let g:NERDTreeShowHidden = 1
nmap <Leader>f :NERDTreeToggle<CR>

" YouCompleteMe
let g:ycm_max_diagnostics_to_display = 10
let g:ycm_key_list_select_completion = ['<c-j>', '<c-Space>']
let g:ycm_key_list_previous_completion = ['<c-k>']
let g:ycm_add_preview_to_completeopt = 0
let g:clang_user_options='|| exit 0'
set completeopt-=preview

" Stylus
autocmd BufRead,BufNewFile *.styl set filetype=stylus

" Shortcuts
ab ㅈ w
ab ㅈㅂ wq

nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>r :e<CR>
nnoremap <Leader>c :SyntasticCheck<CR>
nnoremap <Leader><Tab> <C-^>
nmap <Leader><Leader> V
imap jk <esc>
imap ㅓㅏ <esc>
map <C-J> :bprev<CR>
map <C-K> :bnext<CR>

