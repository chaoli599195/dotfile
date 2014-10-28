set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'honza/vim-snippets'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - nstalls plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" Bundles
 Bundle 'lokaltog/vim-easymotion'
 Bundle 'tomtom/tcomment_vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/syntastic'
 Bundle 'valloric/youcompleteme'
 Bundle 'majutsushi/tagbar'
 Bundle 'sirver/ultisnips'
 Bundle 'tpope/vim-surround'
 Bundle 'terryma/vim-multiple-cursors'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'mhinz/vim-signify'




" Minimal vim settings without plugins/bundles
 let mapleader='\'

 " Basic settings
 set number "sets numbers
 set softtabstop=4
 set shiftwidth=4
 set tabstop=4
 set autoindent
 set cindent
 set ignorecase
 set vb " turns off visual bell
 set history=50 " keep 50 lines of command line history
 set ruler	" show the cursor position all the time
 set showcmd	" display incomplete commands
 set incsearch " do incremental searching
 set hlsearch
 set hidden
 set backspace=indent,eol,start 
 set wildmenu

 set cursorline
 set cursorcolumn

 syntax on
 filetype plugin indent on "Tell plugins and indents about the file

 " Status line
 set laststatus=2
 set statusline=
 set statusline+=%-3.3n\                      " buffer number
 set statusline+=%f\                          " filename
 set statusline+=%h%m%r%w                     " status flags
 set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
 set statusline+=%=                           " right align remainder
 set statusline+=0x%-8B                       " character value
 set statusline+=%-14(%l,%c%V%)               " line, character
 set statusline+=%<%P                         " file position

 " Keyboard shortcuts
 noremap <leader>s :set hls!<bar>set hls?<CR>
 noremap <leader>p :set paste!<bar>set paste?<CR>
 noremap <leader>g :grep <C-r><C-w><CR>:cw<CR>
 noremap <leader>G :grep<space>
 noremap gn :cn<CR>
 noremap gN :cp<CR>
 noremap <leader>c :!ctags -R --languages=
 noremap <leader>] :tn<CR>
 noremap <leader>[ :tp<CR>
 cnoremap %% <C-R>=expand('%:p:h')<CR>/
 noremap <leader>v :e ~/.vimrc<CR>
 nnoremap <silent> <F5> :TagbarToggle<CR>
 nnoremap <silent> <F6> :NERDTreeToggle<CR>

 " Abbreviations
 autocmd Filetype python ab ipdb import ipdb; ipdb.set_trace
 autocmd Filetype python ab ifname if __name__ == '__main__':<CR>

 " Remap buffer movement
 map <c-h> <c-w>h
 map <c-j> <c-w>j
 map <c-k> <c-w>k
 map <c-l> <c-w>l

 " Automatically remove trailing whitespace in python files
 autocmd BufWritePre *.py :%s/\s\+$//e

 " Ignore certain filetypes
 set wildignore+=*.so,*.swp,*.zip
 set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exeTag
 set wildignore+=*.pyc

 " Set up omnicomplete files
 autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
 autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set background=dark
set t_Co=256
if &term =~ 'xterm-color'
    set t_ut=
endif
colorscheme solarized
execute pathogen#infect()
set expandtab

"multicursor
let g:multi_cursor_use_default_mapping=1
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"ycm
nnoremap <leader>gt :YcmCompleter GoToDefinitionElseDeclaration<CR>

"set vim-signigy
let g:signify_vcs_list = [ 'git']
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'

"ultisnips

" Snippets are separated from the engine. Add this if you want them:

" Trigger configuration. Do not use <tab> if you use YCm
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"disable auto syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>se :SyntasticCheck<CR>
nnoremap <leader>sr :SyntasticReset<CR>

"auto bracket complete

inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i

inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
set showmatch

" Easymotion
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
let g:EasyMotion_landing_highlight = 1

"All magic Functions

"handles ultisnips with ycm
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"



" move between tabs
function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

" nnoremap <C-m> :call MoveToNextTab()<CR><C-w>H
" nnoremap <C-n> :call MoveToPrevTab()<CR><C-w>H
