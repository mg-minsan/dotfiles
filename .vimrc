call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vundlevim/vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'valloric/matchtagalways'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
"plug 'ervandew/supertab'
"Plug 'posva/vim-vue'
"Plug 'nelstrom/vim-textobj-rubyblock'
"Plug 'kana/vim-textobj-user'
"Plug 'tpope/vim-rails'
"Plug 'vim-ruby/vim-ruby'
"Plug 'tpope/vim-bundler'
"Plug 'tpope/vim-haml'
"Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-dispatch'
"Plug 'tpope/vim-endwise'
"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/vim-github-dashboard'
"Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
Plug 'ntpeters/vim-better-whitespace'
"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'itchyny/lightline.vim'
"Plug 'mustache/vim-mustache-handlebars'
"Plug 'kchmck/vim-coffee-script'
"Plug 'elixir-editors/vim-elixir'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'elmcast/elm-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
"Plug 'cocopon/pgmnt.vim'
"Plug 'arcticicestudio/nord-vim'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'elixir-editors/vim-elixir'
"Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rakr/vim-one'
"vim snippet
"
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
call plug#end()
let &t_ut='' "For kitty
let &t_ut='' "For kitty
syntax enable
set termguicolors
color dracula
"set background=light
set encoding=utf-8
let mapleader = ","
let g:mapleader = ","
let g:coc_global_extensions = ['coc-solargraph']
set mouse=a
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
"for git commit
"autocmd Filetype gitcommit setlocal spell textwidth=72
"ruby specific
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set swapfile
set dir=/tmp
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
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" No annoying sound on errors
set noerrorbells
set novisualbell
set relativenumber
set t_vb=
set tm=500
"golang
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_extra_types=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_autosave=1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

autocmd BufWritePre *.go silent! call CocAction('runCommand', 'editor.action.organizeImport')
" Status line types/signatures
"let g:go_auto_type_info = 1
"let g:go_auto_type_info = 1
"set updatetime=100

" for language server
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'], 
      \ 'typescript.tsx': ['javascript-typescript-stdio'],
      \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
set signcolumn=yes 
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
"set list listchars=nbsp:·
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
set guifont=Inconsolata\ Regular\ 12
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

nmap <leader>b :NERDTreeToggle<cr>
let g:NERDTreeBookmarksFile = $HOME ."/.vim/bookmarks"
"------------------------------Auto-commands------------------------------"
"Automatically source vimrc after save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""""""coc implementation 
"""""""coc implementation 
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
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
if has("patch-8.1.1564")
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
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"

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
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""
command! -nargs=0 Prettier :CocCommand prettier.formatFile


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
"
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! Tags call s:btags()
