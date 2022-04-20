set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
" othree/javascript-libraries-syntax.vim
Plugin 'https://github.com/othree/javascript-libraries-syntax.vim.git'
" Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'

"https://github.com/feix760/vim-javascript-gf
"Plugin 'feix760/vim-javascript-gf'

"https://github.com/JamshedVesuna/vim-markdown-preview
Plugin 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

set guifont=Courier\ New\:h12
set guifontwide=NSimsun\:h12

set hlsearch            "高亮度反白
set backspace=2         "可隨時用倒退鍵刪除
set autoindent          "自動縮排
set ruler               "可顯示最後一行的狀態
set showmode            "左下角那一行的狀態
set nu                  "可以在每一行的最前面顯示行號啦！
set bg=dark             "顯示不同的底色色調
color industry          " Same as :colorscheme industry
set cursorline          " 啟用行游標提示。
":hi 等同 :highlight
"hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
"hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
"set t_Co=256
syntax enable
syntax on               "進行語法檢驗，顏色顯示。

set nocompatible	"双引号开始的行为注释行，下同去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
filetype on 		"检测文件的类型
set history=1000 	"记录历史的行数

set autoindent		"vim使用自动对起，也就是把当前行的对起格式应用到下一行
set smartindent		"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编
set showmatch		"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set vb t_vb=		"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set ruler		"在编辑过程中，在右下角显示光标位置的状态行
"set nohls		"默认情况下，寻找匹配是高亮度显示的，该设置关闭高亮显示
set incsearch		"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词时，别忘记回车

" cusotom filetype
autocmd BufNewFile,BufRead *.phtml set syntax=php
autocmd BufNewFile,BufRead *.json set syntax=javascript filetype=json
autocmd BufNewFile,BufRead *.jsx set syntax=javascript
autocmd BufNewFile,BufRead *.ts set syntax=javascript
autocmd BufNewFile,BufRead *.vue set syntax=html filetype=html

" :setlocal can check Filetype
autocmd Filetype php setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" bdd: https://cucumber.io/
autocmd BufNewFile,BufRead *.feature set syntax=cucumber
autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
"autocmd BufReadPre *.feature let b:javascript_lib_use_jquery = 0
"autocmd BufReadPre *.feature let b:javascript_lib_use_underscore = 0
"autocmd BufReadPre *.feature let b:javascript_lib_use_backbone = 0
"autocmd BufReadPre *.feature let b:javascript_lib_use_react = 0
"autocmd BufReadPre *.feature let b:javascript_lib_use_chai = 1

"softtabstop: replace tab
autocmd BufNewFile,BufRead *.vue set syntax=javascript filetype=html

" set expandtab when spefic filetype
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

" shell script
autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

set runtimepath^=~/.vim/bundle/node

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set foldmethod=indent foldlevel=99

autocmd BufWritePre * :%s/\s\+$//e
"autocmd BufWritePre *.phtml :retab

"按 F5 會自動啟用 NERDTree 檔案總管
nnoremap <silent> <F5> :NERDTree<CR>

"下 Tlist 指令，會出現文件結構列表，在列表某名字按 Enter 會自動跳至該程式名
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"Tlist + WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
"設定 WinManager 的宽度，預設為25
let g:winManagerWidth = 30
"在进入vim时自动打开winmanager
let g:AutoOpenWinManager = 1
"定義打開關閉 WinManager 按键
nmap <silent> <F8> :WMToggle <CR>
"退出时不会像只有taglist时候那样，退出当前文件就会退出vim了
let Tlist_Exit_OnlyWindow=1

"这个是设定是否使用 quickfix 窗口来显示 cscope 結果
set cscopequickfix=s-,c-,d-,i-,t-,e-
"在資料夾根目錄輸入 cscope -bR 讓 cscpe 建立資料
cs add /home/joe10330/git/eserv/cscope.out /home/joe10330/git/eserv/

nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"Theme color
"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

filetype plugin on
let g:BASH_AuthorName   = 'Joe Angel'
let g:BASH_Email        = 'joe10330@@gmail.com'
let g:BASH_Company      = 'none'
