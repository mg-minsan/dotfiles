call plug#begin('~/.vim/plugged')
plug 'junegunn/vim-easy-align'
plug 'vundlevim/vundle.vim'
"plug 'kien/ctrlp.vim'
plug 'tpope/vim-vinegar'
plug 'scrooloose/nerdtree'
plug 'scrooloose/nerdcommenter'
plug 'tpope/vim-surround'
plug 'valloric/matchtagalways'
plug 'scrooloose/syntastic'
plug 'tpope/vim-fugitive'
"plug 'ervandew/supertab'
plug 'posva/vim-vue'
plug 'nelstrom/vim-textobj-rubyblock'
plug 'kana/vim-textobj-user'
plug 'tpope/vim-rails'
plug 'vim-ruby/vim-ruby'
plug 'tpope/vim-bundler'
plug 'tpope/vim-haml'
plug 'ngmy/vim-rubocop'
plug 'tpope/vim-dispatch'
plug 'tpope/vim-endwise'
plug 'junegunn/seoul256.vim'
plug 'junegunn/vim-github-dashboard'
plug 'sirver/ultisnips'
plug 'honza/vim-snippets'
plug 'sirver/ultisnips'
plug 'tpope/vim-commentary'
plug 'junegunn/goyo.vim'
plug 'junegunn/limelight.vim'
plug 'bronson/vim-trailing-whitespace'
"fzf
plug 'junegunn/fzf', { 'dir': '~/.fzf' }
plug 'junegunn/fzf.vim'
plug 'godlygeek/tabular'
plug 'plasticboy/vim-markdown'
plug 'vim-airline/vim-airline'
plug 'vim-airline/vim-airline-themes'
plug 'mustache/vim-mustache-handlebars'
plug 'kchmck/vim-coffee-script'
plug 'elixir-editors/vim-elixir'
plug 'kylef/apiblueprint'
plug 'neoclide/coc.nvim', {'branch': 'release'}
plug 'elmcast/elm-vim'
plug 'othree/yajs.vim'
plug 'mxw/vim-jsx'
plug 'autozimu/languageclient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"vim snippet
"
plug 'prettier/vim-prettier', {
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
