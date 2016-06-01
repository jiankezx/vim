source ~/.vim/bundles.vim

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set encoding=utf-8

" enable filetype dectection and ft specific plugin/indent
set nocp
filetype on
filetype plugin indent on

" enable syntax hightlight and completion
syntax enable
"syntax on

"color desert
colorscheme jellybeans

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search
"set ruler
set incsearch
"setshighlight 	" conflict with highlight current line
set hlsearch
set ignorecase
set smartcase

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
"set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
"set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
"set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
set foldmethod=syntax
" set relativenumber

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set textwidth=79
" set smarttab
"set expandtab       " expand tab to space

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120

" syntax support
"autocmd Syntax c set syntax=c
"autocmd Syntax javascript set syntax=JQuery  " JQuery syntax support
" js
"let g:html_indent_inctags =
""html,body,head,tbody"
"let g:html_indent_script1 =
""inc"
"let g:html_indent_style1 =
""inc"

"-----------------
" Plugin settings
"-----------------
" Rainbow parentheses for Lisp and variants
"let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['black',       'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]
"let g:rbpt_max = 40
"let g:rbpt_loadcmd_toggle = 0
"autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" 让 syntastic忽略 python 文件
let g:syntastic_ignore_files=[".*\.py$"]

" map <Leader>
let mapleader=";"
" easy-motion
let g:EasyMotion_leader_key = '<Leader><Leader>'

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" tag for c
"if executable('c')
  let g:tagbar_type_c = {
        \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 'n:namespace',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'g' : 'enum',
        \ 'n' : 'namespace',
        \ 'c' : 'class',
        \ 's' : 'struct',
        \ 'u' : 'union'
        \ },
        \ 'scope2kind' : {
        \ 'enum'        : 'g',
        \ 'namespace'   : 'n',
        \ 'class'       : 'c',
        \ 'struct'      : 's',
        \ 'union'       : 'u'
        \ }
    \ }

""  let g:tagbar_type_markdown = {
""    \ 'ctagstype' : 'markdown',
""    \ 'sort' : 0,
""    \ 'kinds' : [
""        \ 'h:sections'
""    \ ]
""    \ }
""endif

" Nerd Tree
nmap <silent> <F3> :NERDTreeToggle<cr>
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos ="right"
let g:NERDTree_title = "[NERDTree]"
 
"noremap <f5> :NERDTreeFind<cr>
" 
let g:Tagbar_title = "[Tagbar]"
let g:persistentBehaviour=0 
""如果所有编辑文件都关闭了，退出vim
 
" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
"let g:user_emmet_expandabbr_key='<C-j>'

" python syntax highlight
let python_highlight_all = 1

" tasklist
"nmap <Leader>td :TaskList

" ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_map = '<leader>ff'

" Keybindings for plugin toggle
"nnoremap <F11> :set invpaste paste?<CR>
"set pastetoggle=<F11>
nmap <silent> <F2> :TagbarToggle<cr>
let g:tagbar_autofocus = 1
"nmap <F10> :Tlist<cr>
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
map <F8> :!ctags -R --c-kinds=+px --fields=+iamKlnzS --extra=+fq --language-force=c .<CR><CR> :TlistUpdate<CR>
imap <F8> <ESC>:!ctags -R --c-kinds=+px --fields=+iamKlnzS --extra=+fq --language-force=c .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=/usr/include/tags
set tags+=./tags

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
"nmap <leader>i :IndentGuidesToggle<cr>
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"hi IndentGuidesOdd guibg=red ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4

nmap <F9> :GundoToggle<cr>
nmap  <D-/> :
"nnoremap <leader>a :Ag
nnoremap <leader>v V`]
"imap <C-I> <Esc>

" config ctrlsf
"let g:ctrlsf_position = 'right'
let g:ctrlsf_ackprg = 'ag'
nnoremap <Leader>sp :CtrlSF<CR>
nmap <C-F> <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordPath
vmap <C-F>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>

"------------------
" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
"cmap w!! %!sudo tee >/dev/null %

" Quickly edit/reload the vimrc file
"nmap <silent> <leader>ev :e $MYVIMRC<CR>
"nmap <silent> <leader>sv :so $MYVIMRC<CR>

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

" eggcache vim
"nnoremap ; :
":command W w
":command WQ wq
":command Wq wq
":command Q q
":command Qa qa
":command QA qa

"" for macvim
"if has("gui_running")
"    set go=aAce  " remove toolbar
"    "set transparency=30
"    set guifont=Monaco:h13
"    set showtabline=2
"    set columns=140
"    set lines=40
"    noremap <D-M-Left> :tabprevious<cr>
"    noremap <D-M-Right> :tabnext<cr>
"    map <D-1> 1gt
"    map <D-2> 2gt
"    map <D-3> 3gt
"    map <D-4> 4gt
"    map <D-5> 5gt
"    map <D-6> 6gt
"    map <D-7> 7gt
"    map <D-8> 8gt
"    map <D-9> 9gt
"    map <D-0> :tablast<CR>
"endif

" you completer
set completeopt=longest,menu
"set completeopt-=preview
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口"
"inoremap <expr> <space>  pumvisible() ? "\<C-y>" : "\<space>"
"回车即选中当前项
inoremap <expr> <CR>    pumvisible() ? '<C-y>' : '<CR>'
"上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? '<C-n>' : '<Down>'
"inoremap <expr> <Up>       pumvisible() ? '<C-p>' : '<Up>'
"inoremap <expr> <PageDown> pumvisible() ? '<PageDown><C-p><C-n>' : '<PageDown>'
"inoremap <expr> <PageUp>   pumvisible() ? '<PageUp><C-p><C-n>' : '<PageUp>'

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion=['<S-TAB>', '<Up>']

"关闭加载.ycm_extra_conf.py提示"
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
let g:ycm_always_populate_location_list = 1
nnoremap <leader>lo :lopen<CR> "open locationlist
nnoremap <leader>lc :lclose<CR>   "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_error_symbol = 'E:'
let g:ycm_warning_symbol = 'W:'
"force recomile with syntastic
"let g:syntastic_error_symbol = 'X'  "set error or warning signs
"let g:syntastic_warning_symbol = 'x'
"let g:syntastic_check_on_open=1
"let g:syntastic_enable_highlighting = 0
""let g:syntastic_python_checker='flake8,pyflakes,pep8,pylint'
"let g:syntastic_python_checkers=['pyflakes']
""highlight SyntasticErrorSign guifg=white guibg=black
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"let g:syntastic_enable_balloons = 1 "whether to show balloons]'

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nmap <F8> :YcmDiags<CR>
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Aireline
"let g:Powerline_symbols = 'fancy'
"set ttimeoutlen=50
let g:airline_symbols = {}
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1

let g:airline_left_sep = "\u2b80"
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_symbols.linenr = "\u2b61"
"设置顶部tabline栏符号显示"
let g:airline#extensions#tabline#left_sep = "\u2b80"
let g:airline#extensions#tabline#left_alt_sep = "\u2b81"
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
