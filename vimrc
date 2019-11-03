" Vim File
"  Filename: vimrc
"   Created: 2013-07-23 01:13:02
"      Desc: Tony Xu's Vim Configuration
"                   _
"   __  __   __   _(_)_ __ ___
"   \ \/ /___\ \ / / | '_ ` _ \
"    >  <_____\ V /| | | | | | |
"   /_/\_\     \_/ |_|_| |_| |_|
"
"    Author: xutao(Tony Xu), hhktony@gmail.com
"   Company: myself

" Init {{{
scriptencoding utf-8

let g:xvim_version = '0.1'

let s:windows = has('win32') || has('win64')
" let $v = $HOME.(s:windows ? '\vimfiles' : '/.vim')

let g:mapleader = ','
" let maplocalleader = ','

let g:xvim_colorscheme_default = 'desert'
let g:xvim_colorscheme = 'molokai'
let g:xvim_background = 'dark'
" }}}

" Functions {{{
func! EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), 'p')
  endif
endfunc
" }}}

" General {{{
if filereadable(expand('~/.vimrc.before'))
  source ~/.vimrc.before
endif

if filereadable(expand('~/.vimrc.plugins'))
  source ~/.vimrc.plugins
endif

let g:plugs = get(g:, 'plugs', {})

filetype plugin indent on

" Enable syntax highlighting by default.
if has('syntax')
  syntax on

  " Reduce processing for syntax highlighting to make it less of a pain.
  syntax sync minlines=2000
  syntax sync maxlines=5000
  set synmaxcol=400
  set redrawtime=4000
endif

set history=50
set number
set shortmess=atI               " I不显启动时的信息
" set showmode                    " 在插入、替换和可视模式里，在最后一行提供消息
set showcmd                     " 在屏幕最后一行显示当前命令
set showmatch                   " 显示括号配对情况
set matchtime=1                 " 跳转到匹配括号的时间
set scrolloff=5                 " 上下滚动保留屏幕3行
" set t_ti= t_te=                 " 退出vim后，内容显示在终端屏幕
" set cmdheight=1                 " 命令行的高度，默认为1
" set vb t_vb=                    " 关闭响铃和闪烁
set novisualbell
set noerrorbells

set ignorecase                  " 搜索时忽略大小写
set smartcase                   " 搜索模式只包含小写字母时才忽略大小写
set gdefault                    " 默认开启全局匹配(在替换时不用输入g)
set incsearch                   " 开启实时搜索功能
set hlsearch                    " 开启高亮显示结果
" set wrapscan                    " 搜索到文件两端时重新搜索
set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags

set wildignorecase
set wildmenu                    " 命令补全
set wildmode=longest:list:full  " 命令模式Tab补全顺序

set ttimeout                    " time out for key codes
set ttimeoutlen=500             " wait up to 500ms after Esc for special key

set backspace=indent,eol,start  " 退格键和方向键可以换行
set whichwrap=b,s,h,l,<,>,[,]   " 允许backspace和光标键跨越行边界

set shiftwidth=4                " 使用4个空格缩进
set tabstop=4                   " 编辑时一个Tab字符占4个空格的位置
set softtabstop=4               " 每次退格将删除4个空格
set expandtab                   " 将输入的Tab自动展开成空格
set smarttab                    " 在行首按Tab将加入sw个空格，否则加入ts个空格

set autoindent                  " 继承前一行的缩进方式
set smartindent                 " 为c/c++程序提供自动缩进
set cindent                     " c/c++样式缩进
set cinoptions=:0,l1,t0,g0      " Linux kernel style
set cpoptions+=$                " cw显示$

" set nowrap                      " 取消自动换行
set textwidth=78
set formatoptions+=mM

set modeline
set autoread
if has('clipboard')
  set clipboard=unnamedplus,unnamed " share clipboar
endif
set hidden                      " 允许在有未保存的修改时切换缓冲区
set ttyfast

" set path+=../include            " gf搜索路径
" set autochdir                   " 当前目录为工作目录

" set iskeyword+=$,%,-,:        " 包含这些字符时当作一个单词
set dictionary+=~/.vim/dict/simple,/usr/share/dict/words " For i_CTRL_X_K

set list                        " 显示Tab符
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白
set completeopt=menu,menuone

set mouse=

set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
" }}}

" Backups {{{
set nobackup
set noswapfile

if has('persistent_undo')
  if has('nvim')
    set undodir=~/.nvimundo
  else
    set undodir=~/.vimundo
  endif
  call EnsureExists(&undodir)
  set undofile
  set undolevels=1000
  set undoreload=10000
endif
" }}}

" VimBase {{{
augroup VimBase
  " Coding style
  autocmd!
  autocmd Filetype sh,zsh,vim,css,html,ruby,php,lua,javascript,json,yaml setlocal ts=2 sts=2 sw=2 ex
  " autocmd Filetype markdown setlocal ts=4 sts=4 sw=4 noet

  " Always jump to the last cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ execute "normal! g`\"" |
    \ endif

  autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
    \   q :cclose<cr>:lclose<cr>
  autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
    \   bd | q | endif
augroup END
" }}}

" UI {{{
set t_Co=256
if &term =~# '256color'
  set t_ut=
endif

if &diff
  if has_key(g:plugs, 'vim-colors-github')
    set background=light
    colorscheme github
  endif
else
  if g:xvim_colorscheme !=# ''
    try
        " exec 'set background=' . g:xvim_background
        exec 'colorscheme ' . g:xvim_colorscheme
    catch
        exec 'colorscheme '. g:xvim_colorscheme_default
    endtry
  else
    exec 'colorscheme '. g:xvim_colorscheme_default
    hi ColorColumn ctermbg=236
    hi StatusLine      ctermfg=238 ctermbg=253
    hi StatusLineNC    ctermfg=244 ctermbg=232
  endif
endif

if has('gui_running')
  set guicursor=           " prevent nvim from changing the cursor shape
  set guioptions-=m        " Disable menu bar
  set guioptions-=T        " Disable the toolbar
  set guioptions-=a        " Do not auto copy selection to clipboard
  set guioptions-=e        " Do not use gui tab apperance
  set guioptions-=r        " Do not show scrollbars
  set guioptions-=R        " Do not show scrollbars
  set guioptions-=l        " Do not show scrollbars
  set guioptions-=L        " Do not show scrollbars
  set guifont=Source\ Code\ Pro\ 14

  " if has('termguicolors')
  "   set termguicolors " Enable 24bit colors in terminal
  " endif
endif

if exists('+colorcolumn')
  augroup ColorColumn
    set colorcolumn=80
    autocmd FileType gitcommit setlocal colorcolumn=50,72
  augroup END
  " set cursorline
endif

" Keep the cursor on the same column
set nostartofline

function! Buffer_total_num()
  return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function! Git_branch()
  let l:branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  if v:shell_error
    let l:branch = ''
  endif
  return l:branch
  return strlen(l:branch) > 0 ? '  '.l:branch.' ':''
endfunction

if has('statusline')
  set laststatus=2
  if !exists('g:loaded_airline')
    set statusline=%<%1*\ %n\:%{Buffer_total_num()}\ %*
    " set statusline+=%6*\ %{Git_branch()}%*
    set statusline+=%2*\ %t%m\ %*
    set statusline+=%3*%r\ %*
    set statusline+=%=%4*\ %y\ %*
    set statusline+=%5*\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\"}[%{&ff}]\ \ %-14.(%l:%c%)%*
    set statusline+=%6*\ %p%%

    hi User1 cterm=bold ctermfg=249 ctermbg=235
    hi User2 cterm=bold ctermfg=118 ctermbg=239
    hi User3 cterm=bold ctermfg=197 ctermbg=239
    hi User4 cterm=None ctermfg=246 ctermbg=237
    hi User5 cterm=None ctermfg=250 ctermbg=238
    hi User6 cterm=None ctermfg=249 ctermbg=240
    hi StatusLine       ctermfg=238 ctermbg=253
    hi StatusLineNC     ctermfg=244 ctermbg=232
  endif
endif
" }}}

" Key (re)Mappings {{{
" nnoremap ; :
" nnoremap : ;
nnoremap <silent> <Leader>fef ggVG=``
" Don't use Ex mode, use Q for formatting.
" map Q gq
nnoremap Q gqip

" Fold
set foldlevelstart=0
nnoremap <Leader>z zMzvzz
" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

" Quit & Save
" nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>
nnoremap <Leader>w :w<CR>
" Delete all spaces
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Buffers
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <Leader>d :bd<CR>
" <Leader>[1-9] move to buffer [1-9]
" for s:i in range(1, 9)
  " execute 'nnoremap <Leader>' . s:i . ' :b' . s:i . '<CR>'
" endfor

nnoremap <silent> <Leader>cb :bd<CR>
nnoremap <silent> <Leader>cq :cclose<bar>lclose<CR>
nnoremap <silent> <Leader>cp :pclose<CR>

" Quickfix
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz
" nnoremap <silent> <Leader>c :cclose<bar>lclose<CR>

" Center screen after navigation shortcuts
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

nnoremap } }zvzz
nnoremap { {zvzz

nnoremap ]] ]]zvzz
nnoremap [[ [[zvzz
nnoremap [] []zvzz
nnoremap ][ ][zvzz
" nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Enhance regular
" nnoremap / /\v
" vnoremap / /\v
" nnoremap ? ?\v
" vnoremap ? ?\v

nnoremap <silent> <Leader><CR> :noh<CR>

set pastetoggle=<Leader>p
" nmap <silent> <Leader>ss :setlocal spell!<CR>

nnoremap <C-\> :!dict <C-R>=expand("<cword>")<CR><CR>

" nnoremap <Leader>rb :%!xxd<CR>
" nnoremap <Leader>nrb :%!xxd -r<CR>

inoremap <C-A> <Esc>I
inoremap <C-E> <Esc>A

nnoremap j gj
nnoremap k gk

nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

vnoremap > >gv
vnoremap < <gv


" emacs like
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <Down>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

" cnoremap w!! %!sudo tee > /dev/null %

command!          FormatJSONPy2 %!python -m json.tool

" Copy file basename only, file path, dirname
command! -nargs=0 CopyFileName  let @+ = expand("%:t") | echo 'Copied to clipboard: ' . @+
command! -nargs=0 CopyFilePath  let @+ = expand("%:p:~") | echo 'Copied to clipboard: ' . @+
command! -nargs=0 CopyFileDir   let @+ = expand("%:p:~:h") | echo 'Copied to clipboard: ' . @+
command! -nargs=0 Save          :call     s:save()

function! s:save()
  let file = $HOME.'/.tmp.log'
  let content = getline(1, '$')
  call writefile(content, file)
endfunction

" }}}

" co? : Toggle options {{{
function! s:map_toggle(...)
  let [l:key, l:opt] = a:000[0:1]
  let l:op = get(a:, 3, 'set '.l:opt.'!')
  execute printf('nnoremap <silent> co%s :%s<bar>set %s?<CR>', l:key, l:op, l:opt)
  " co<k>
endfunction

call s:map_toggle('p', 'paste')
call s:map_toggle('n', 'number')
call s:map_toggle('w', 'wrap')
call s:map_toggle('h', 'hlsearch')
call s:map_toggle('m', 'mouse', 'let &mouse = &mouse == "" ? "a" : ""')
call s:map_toggle('t', 'textwidth',
    \ 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
call s:map_toggle('b', 'background',
    \ 'let &background = &background == "dark" ? "light" : "dark"<bar>redraw')
" }}}

" Folding {{{
" au BufWintogglet! mkview
" au BufWinEnter * silent! loadview
" }}}

" Color scheme selector {{{
" function! s:colors(...)
"   return filter(map(filter(split(globpath(&runtimepath, 'colors/*.vim'), "\n"),
"         \                  'v:val !~# "^/usr/"'),
"         \           'fnamemodify(v:val, ":t:r")'),
"         \       '!a:0 || stridx(v:val, a:1) >= 0')
" endfunction
"
" function! s:rotate_colors()
"   if !exists('s:colors')
"     let s:colors = s:colors()
"   endif
"   let l:name = remove(s:colors, 0)
"   call add(s:colors, l:name)
"   execute 'colorscheme' l:name
"   redraw
"   echo l:name
" endfunction
" nnoremap <silent> <F8> :call <SID>rotate_colors()<CR>
" }}}

" matchit.vim {{{
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
" }}}

" man.vim {{{
if filereadable($VIMRUNTIME . '/ftplugin/man.vim')
  source $VIMRUNTIME/ftplugin/man.vim
  nnoremap <silent> <S-k> :Man <c-r>=expand("<cword>")<CR><CR>
endif
" }}}

" Self Documenting Vim Key Mappings {{{
" Show all keymappings
nnoremap <Leader>? :map <Leader><CR>
nnoremap <Leader>a? :map <Leader>a<CR>
nnoremap ]? :map ]<CR>
nnoremap [? :map [<CR>
" }}}

" Load after config {{{
if filereadable(expand('~/.vimrc.after'))
  source ~/.vimrc.after
endif
" }}}

" vim: set et sw=2 ts=2 sts=2 tw=78 fdl=0 fdm=marker:
