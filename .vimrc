so ~/.vim/plugins.vim           " source plugins.vim file
let &t_ut='' "For kitty
colorscheme gruvbox
set encoding=utf-8
set background=dark
let mapleader = ","
let g:mapleader = ","
"for git commit
autocmd Filetype gitcommit setlocal spell textwidth=72
"ruby specific
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set noswapfile
" Numbers
set number
set numberwidth=5
"no bell
set visualbell
set t_vb=
" Linebreak on 500 characters
set lbr
set tw=500
"enable vim status line
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>
" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

if has("autocmd")
  filetype indent plugin on
endif

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
"for vim ruby
let g:ruby_indent_access_modifier_style="indent"
" Use ack instead of grep
"set grepprg=ack
set nocompatible
"filetype on
"filetype plugin on
set ignorecase                  " ignore case when searching
set smartcase
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

"set the autocomplete as zsh
set wildmenu
set wildmode=full
set autowriteall                       "auto write after swift

"left the filename in file path %:h
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Use one space, not two, after punctuation.
set nojoinspaces

"no beep
set visualbell
set t_vb=
set noeb vb t_vb=

set showcmd "display incomplete command
set ruler         " show the cursor position all the time

"------------------------------Split------------------------------"
" split management
set splitbelow
set splitright

" mapping for split to use Ctrl
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"------------------------------Search------------------------------"
set hlsearch
set incsearch

"------------------------------Visual------------------------------"
"statusbar
hi User1 guifg=#FF0000 guibg=#455A64
:set laststatus=2
set statusline=\ %{toupper(mode())}                                             "Mode
set statusline+=\ \│\ %{fugitive#head()}                                        "Git branch
set statusline+=\ \│\ %4F                                                       "File path
set statusline+=\ %1*%m%*                                                       "Modified indicator
set statusline+=\ %w                                                            "Preview indicator
set statusline+=\ %r                                                            "Read only indicator
set statusline+=\ %q                                                            "Quickfix list indicator
set statusline+=\ %=                                                            "Start right side layout
set statusline+=\ %{&enc}                                                       "Encoding
set statusline+=\ \│\ %y                                                        "Filetype
set statusline+=\ \│\ %p%%                                                      "Percentage
set statusline+=\ \│\ %l/%L                                                     "Current line number/Total line numbers
set statusline+=\ \│\ %c                                                        "Column number

"
set t_Co=256
set guifont=Inconsolata\ Regular\ 11
set linespace=7
"change vertical split colunm color
hi vertsplit guifg=fg  guibg=bg

if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"Keep Gvim minmun
set guioptions-=m "remove menubar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scroll bar



"------------------------------Mapping------------------------------"

nmap <C-V> :put+<cr>
imap <C-V> <esc>:put+<cr><S-A>

" Edit .vimrcafter file"
nmap <leader>ev :tabedit $HOME/.vimrc<cr>
"Edit plugin file
nmap <leader>ep :tabedit $HOME/.vim/plugins.vim<cr>
nmap <leader><space> :nohlsearch<cr>

"mapping for tag
"nmap <leader>t :tag<space>
" For Rail-vim
nmap <leader>rc :Econtroller<space>
nmap <leader>rm :Emodel<space>
nmap <leader>rv :Eview<space>
nmap <leader>rs :Espec<space>

"buffer mapping
nnoremap <silent> [b :bprevious<cr>
nnoremap <silent> ]b :bnext<cr>
nnoremap <silent> [B :bfirst<cr>
nnoremap <silent> ]B :blast<cr>

"------------------------------Plugins------------------------------"
"
"/
"/Fzf
"/
nmap <c-P> :Files <cr>
nmap <c-E> :Buffers<cr>
nmap <c-R> :Tags<cr>

" Customize fzf colors to match your color scheme
let $FZF_DEFAULT_COMMAND = 'ag -g ""' "git ignore
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
"speed up ctrlp
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

nmap <C-n> :NERDTreeToggle<cr>


"------------------------------Auto-commands------------------------------"
"Automatically source vimrc after save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END





"------------------------------Tips-and-Tricks------------------------------"

"--------------------------------------------------------------------
" } can used to check the location of certian tag - useful for finding
" function loaction
"
"--------------------------------------------------------------------
" '0 to go to state before application is closed

" } can used to check the location of certian tag - useful for finding
"
" install exuberant-ctags for ctrl-p on ubuntu
