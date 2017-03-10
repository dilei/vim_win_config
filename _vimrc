source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap jj <ESC>
" 定义快捷键的前缀，即<Leader>
let mapleader=";"

set fileformat=unix

" 基于语法进行代码折叠
" set foldmethod=syntax
" 基于缩进进行代码折叠
" set foldmethod=indent
" 基于标记进行代码折叠
set foldmethod=marker
" 启动 vim 时折叠代码
" set foldenable
" 用空格键来开关折叠  
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  

syntax enable 

set tabstop=4
set softtabstop=4
" 软制表符表示在Insert模式的时候按退格键时退回缩进的长度，当使用expandtab 时特别有用。
set shiftwidth=4
set expandtab

set number

" 隐藏菜单栏
"set guioptions-=m 
" 隐藏工具栏
set guioptions-=T 


set noundofile
set nobackup
set noswapfile
" 这样的话，un~文件就会被统一写入~/.undodir里面，不会四处分散了
" undodir=~/.undodir

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")  
 set fileencoding=chinese  
else  
 set fileencoding=utf-8  
endif 

"解决菜单乱码  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  

"字体
set guifont=SimSun-ExtB:h14

"全屏显示
autocmd GUIEnter * simalt ~x


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


""""""""""""""""""""""""""""""
" NERDTree 
""""""""""""""""""""""""""""""
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <F1> :NERDTree d:/work_code<CR>

" 设置NERDTree子窗口宽度
let NERDTreeWinSize=25
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
" let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 按下 F2 调出/隐藏 NERDTree
nmap <F2> :silent! NERDTreeToggle<CR>
"— 使用箭头代替’+’, ‘-‘符号
let NERDChristmasTree=1

" vim全屏
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
imap <F11> :call libcallnr(“gvimfullscreen.dll”, “ToggleFullScreen”, 0)<CR>





