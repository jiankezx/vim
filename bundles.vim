set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"------------------
" Code Completions
"------------------
"Bundle 'Shougo/neocomplcache' "autocomplete plug
"Bundle 'mattn/emmet-vim' "Html plug
"Bundle 'Raimondi/delimitMate' "自动补全括号
"Bundle 'ervandew/supertab'
" snippets
"Bundle 'garbas/vim-snipmate' "自动补全
"Bundle 'honza/vim-snippets'
"------ snipmate dependencies -------
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
"Bundle 'edsono/vim-matchit' "html plug
Bundle 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
"Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter' 
"fast comment
Bundle 'sjl/gundo.vim'   
"record undo
Bundle 'godlygeek/tabular' 
"auto duiqi
Bundle 'nathanaelkane/vim-indent-guides' 
"chui zhi suo jin dui qi

"--------------
" IDE features
"--------------
Bundle 'scrooloose/nerdtree'
"Bundle 'humiaozuzu/TabBar'
Bundle 'majutsushi/tagbar'
"Bundle 'mileszs/ack.vim' "quan ju sou suo  same as ag.vim
"Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-fugitive' "pei se
"Bundle 'Lokaltog/vim-powerline' "status line
Bundle 'scrooloose/syntastic' 
"syntax check
Bundle 'bronson/vim-trailing-whitespace' 
"whitespace check

"-------------
" Other Utils
"-------------
" Bundle 'humiaozuzu/fcitx-status'
"Bundle 'nvie/vim-togglemouse' "strong mouse

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- web backend ---------
"Bundle '2072/PHP-Indenting-for-VIm'
"Bundle 'tpope/vim-rails'
"Bundle 'lepture/vim-jinja'
"Bundle 'digitaltoad/vim-jade'

"------- web frontend ----------
"Bundle 'othree/html5.vim'
" Bundle 'tpope/vim-haml'
"Bundle 'pangloss/vim-javascript'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'nono/jquery.vim'
" Bundle 'groenewege/vim-less'
" Bundle 'wavded/vim-stylus'
" Bundle 'nono/vim-handlebars'

"------- markup language -------
"Bundle 'tpope/vim-markdown' "ruby
" Bundle 'timcharper/textile.vim'

"------- Ruby --------
" Bundle 'tpope/vim-endwise'

"------- Go ----------
"Bundle 'fatih/vim-go'

"------- FPs ------
"Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'wlangstroth/vim-racket'
" Bundle 'vim-scripts/VimClojure'
" Bundle 'rosstimson/scala-vim-support'

"--------------
" Color Schemes
"--------------
"Bundle 'rickharris/vim-blackboard'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'rickharris/vim-monokai'
"Bundle 'tpope/vim-vividchalk'
"Bundle 'Lokaltog/vim-distinguished'
"Bundle 'chriskempson/vim-tomorrow-theme'
"Bundle 'fisadev/fisa-vim-colorscheme'

"Bundle 'OmniCppComplete'
Bundle 'dyng/ctrlsf.vim'
Bundle 'rking/ag.vim'
"Bundle 'Valloric/YouCompleteMe'
" ycm python complete support
Bundle "davidhalter/jedi"
"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'vim-scripts/matchit.zip' "fu hao pi pei
"Bundle 'SirVer/ultisnips' "guan jian zi yu ju bu quan
Bundle 'hdima/python-syntax'
Bundle 'vim-scripts/TaskList.vim'

Bundle "bling/vim-airline"
Bundle 'winmanager'

"Bundle 'vim-airline/vim-airline-themes'

filetype plugin indent on     " required!
