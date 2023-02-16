set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
"文件检索ctrl+p
Plugin 'ctrlp.vim'
"vim包管理工具
Plugin 'gmarik/Vundle.vim'
"vim自动格式化(配合命令行eslint phplint xxxx等使用)
Plugin 'Chiel92/vim-autoformat'
"文件目录分屏
Bundle 'scrooloose/nerdtree'
"文件目录增加git 状态
Plugin 'Xuyuanp/nerdtree-git-plugin'
"文件函数/类名提取分屏
Bundle 'majutsushi/tagbar'
"小黑屋模式
Bundle 'junegunn/goyo.vim'
"tab智能补全
Plugin 'ervandew/supertab'
"函数快速检索（前端开发可以不配置）
Plugin 'tacahiroy/ctrlp-funky'
 
"js 全家桶
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
"语法检测
Plugin 'scrooloose/syntastic'
"html emmet
Plugin 'mattn/emmet-vim'
"代码折叠
Plugin 'tmhedberg/SimpylFold'
"自动补全(vim难装插件之一)
Plugin 'Valloric/YouCompleteMe'
"vim底层命令行git美化
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"vim主题(vscode主题，可以不装)
Plugin 'tomasiser/vim-code-dark'
 
"ack命令在vim中的快速检索
Plugin 'mileszs/ack.vim'
"https://beyondgrep.com/ack-2.24-single-file > /usr/local/bin/ack

"代码可视化缩进块
Plugin 'nathanaelkane/vim-indent-guides'

"彩虹括号
Plugin 'kien/rainbow_parentheses.vim'

"搜索快乐就完事了
Bundle 'Lokaltog/vim-easymotion'

"youcomplateme 通过 jedi补全python
Bundle "davidhalter/jedi"

"括号自动匹配
Plugin 'jiangmiao/auto-pairs'

"真彩色
Plugin 'tpope/vim-sensible'

"git左边栏增删改提示
Plugin 'airblade/vim-gitgutter'

" tmux Status Line, 依赖 powerline,tmux组件
Plugin 'edkolev/tmuxline.vim'

" 只有mac能用，依赖mac必须装dash APP, 用法 Dash xxx javascript
" 非mac，可以用https://github.com/KabbAmine/zeavim.vim
Plugin 'rizzatti/dash.vim'

"scala 语法解析
Plugin 'derekwyatt/vim-scala'

"PEP8 python格式化pip3 install --upgrade autopep8
Plugin 'tell-k/vim-autopep8'


filetype plugin indent on
call vundle#end()
set runtimepath^=~/.vim/bundle/ctrlp.vim
 
"""tagbar相关配置(ctags可执行文件不能是mac只带的ctags，mac用户需要brew install
"""ctags 并且软连接 ctags
"""为当前环境变量的ctags,然后利用ctags生成tags文件给vim函数分屏读取
"""
"let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:tagbar_right=1
set tags=tags;
set autochdir
"ctrl+m开启文件tagbar(就是函数提示分屏)
map <C-m> :TagbarToggle<CR>
"""

"文件目录树分屏ctrl+n
map <C-n> :NERDTreeToggle<CR>

"显示行号
set nu
"高亮搜索
set hlsearch
set ruler
set showmode
syntax on
"使用空格代替缩进.tab默认2个（前端），后端默认4个是吧
set tabstop=4
set shiftwidth=4
set expandtab
"文件编码模式指定utf
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"""ctrlp 文件检索配置ctrl + p
nmap <F12> <ESC>:.cc<CR><C-W>p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_open_multiple_files = 'ij'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}
let g:SuperTabDefaultCompletionType = 'context'
"""
 
syntax enable

"主题色配置
colorscheme onedark 
set nocompatible
"设置不产生swp文件
set nobackup
set autochdir
"字体配置
set guifont=Consolas:h17
set laststatus=2
set backspace=2
"一些vim内置高亮覆盖,参考highlight
"highlight LineNr cterm=bold ctermfg=242 
"hi Search cterm=NONE ctermfg=blue ctermbg=black cterm=reverse
"highlight Directory ctermfg=blue
set cursorline
 
"""jsx配置(一定要保证你eslint是全局的啊,软链接到/usr/local/bin/下面)
"let g:jsx_ext_required = 1 " Allow JSX in normal JS files
"js AutoFormat配置
"eslint 建议用项目里面的node_modules里的eslint.js bin 文件 sudo ln -s /Users/fdd/work/agent-activity-website/node_modules/eslint/bin/eslint.js /usr/local/bin/eslint
"let g:syntastic_javascript_checkers = ['eslint']
"eslint保存检测太卡了(太吃配置，改成被动模式)
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_mode_map={'mode': 'passive'}
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_warning_symbol = "\u26A0"
"let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
"let g:formatters_javascript = ['eslint']
highlight SyntasticError ctermfg=240 ctermbg=204
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"-->  上面定义的 formatter 做了这些事情：
"-->  1将标准输入写到临时文件eslint-temp-xxx.js
"-->  2调用 eslint --fix 来修复它
"-->  3将 eslint-temp-xxx.js 输出到标准输出。
"-->  4截掉文件尾的换行（\n）
"-->  5删掉临时文件
"-->  临时文件放在当前目录而非/tmp。否则 eslint 会根据 /tmp/eslint-temp-xxx.js 路径来读取配置文件。
"-->  临时文件不命名为隐藏文件。否则 eslint 会忽略它。
"-->  干掉文件尾的换行。这是因为 Vim 读入文件尾的换行后，会再来一个换行产生两个\n。
"-->  autoformat 触发
"F3快捷键开始自动格式化(eslint自动格式化)
noremap <F3> :Autoformat<CR>:w<CR>

"""html emmet(输入 tr>td*3 然后在插入模式下 ctrl+y+,（逗号）  开启emmet补全)
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 1
autocmd FileType jsx,html,css,js EmmetInstall
set directory=$HOME/.vim/swapfiles//
"""

"代码折叠
set foldmethod=indent
augroup AutoSaveFolds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent loadview 1
augroup END
"用空格来切换折叠状态
nnoremap <space> za             

"""---这条配置仅使用mac用户！！！就是你想要的vim的快捷键复制，直接在外面的qq能够黏贴出来！！！(不再需要什么tmux,xclip中转了)
set clipboard=unnamed

"""底层命令行美化，好像可以不装字体
"先安装字体 git clone https://github.com/powerline/fonts.git --depth=1 
"./install.sh

"""powerline配置
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color

""" you complate me 配置 
""" 安装
"  --> 装好后去bundle里面编译，最好看文档
"  --> https://github.com/Valloric/YouCompleteMe#mac-os-x
"  --> install
"  --> cd ~/.vim/bundle/YouCompleteMe
"  --> ./install.py --clang-completer
" 2个字符之后自动补全
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" ycm预览窗口不显示
set completeopt-=preview
" 补全之后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0
" 设置默认预览窗口在下面
set splitbelow
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 传说中的vim8 + ycm异步补全, 2个字符后开始补全
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.python = ['re!(?=[a-zA-Z_]{2})']

" F1 手动开启函数文档
noremap <F1> :YcmCompleter GetDoc<CR>
"""

"""
"ctags配置热键自动更新
"""
function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=python,php,javascript --links=yes --fields=+iaS --extra=+q
    endif
    execute ":cd " . curdir
endfunction
nmap <F5> :call UpdateCtags()<CR>

"智能缩进，当匹配到func main() {}
"当在大括号中间回车的时候，他会智能缩进，因为他知道括号中间要缩进
set smartindent

"自动缩进，当你第一行敲 tab + 文字 回车后 下一行自动给你加个 tab 
set autoindent

"自定义map示例,CR(cr)代表回车,空格可以直接用Space或者一个空白符代替
map <F9> i### 作者: 张昱升<Space>  DEV<CR>### 参数:<CR>### 含义:<CR><ESC>

"自定义mapleader 前缀按键申明, 按 逗号 + w键
"可以写入并且保存(相当于底层命令行模式执行了 w!)
let mapleader=","
map <leader>w :w!<CR>

"支持光标快速移动，就是支持鼠标滚轮啦,如果用的item2，如果你滚轮,它会提示你要不要开启滚轮上拉，如果开启就不需要开启这个配置，开启这个模式复制的话要按住option键
"set mouse=a

"代码缩进块显示 + 奇偶行缩进颜色配置 + 缩进块宽度
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_color_change_percent = 1

"彩虹括号
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""搜索快乐就完事了
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
"""

"因为Python已经有pylint来检查, 而且syntastic检查Python会在保存时有很长时间的卡顿, 所以禁用它对Python文件的检查
let g:syntastic_ignore_files=[".*\.py$"]
"let g:syntastic_python_python_exe = 'python3'
"let g:syntastic_python_pylint_post_args =    \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol} {msg_id}] {msg} <---------->"'

"nerdTree 忽略pyc文件
let NERDTreeIgnore = ['\.pyc$']

"""VimScript教程
"启动加载echom 打入vim启动日志,命令 messages
echom "Never Give Up Your Dream!!! >^.^<"

"空格选中整个单词，覆盖折叠folder的插件快捷键
map <space> viw

" -键 作为删除一行
map - dd

"上移一行
map _ k

"nmap -> normalmap
"vmap -> visualmap
"imap -> insertmap
"n + nore(不解释映射对象) + map
"v + nore(不解释映射对象) + map
"i + nore(不解释映射对象) + map
"\ 在通用模式下删除一行 
"nmap \ -
nnoremap \ dd

" U 在可视化模式下大写选中单词
vnoremap \ U

" ctrl+d 插入模式下删除一行,ecs回到普通模式，i再回到插入模式
inoremap <c-d> <esc>ddi

" ctrl+u 插入模式转换当前单词为大写
inoremap <c-u> <esc>viwUi

"映射按键序列
nnoremap -d dd
nnoremap -c dd0

"leader 前缀使用, 关联233行
nnoremap <leader>d dd

"重读我的vimrc文件
nnoremap <leader>sv :source $MYVIMRC<cr>
"打开我的vimrc配置文件
nnoremap <leader>ev :vsp $MYVIMRC<cr>

"nnoremap <leader>zb :term zsh<cr>mpv "https://www.youtube.com/watch?v=OQZQ-VGbZAY" -vo tct<cr>
"nnoremap <leader>zb :vsp<cr>:sp<cr>:resize 20<cr>:vertical res 50<cr>
nnoremap <leader>zb :vsp<cr>:term zsh<cr>mpv "http://www.youtube.com/watch?v=OQZQ-VGbZAY" -vo tct<cr>

"利用hl.py脚本高亮py脚本编译的结果，提供舒适的可视化输出
nnoremap <leader>r :! python3 %\|/Users/tap/zys/study/py_fluent/hl.py<cr>

" * 注意映射可以死循环
" nmap dd O<esc>jddk   dd 嵌套 dd命令，会无限死循环

"# abbreviations 缩略语
iabbrev adn and

"普通模式下，双引号包括当前单词
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

"插入模式下，jk退出插入模式,顺便提下 <c-[>也是可以退出插入模式
inoremap jk <esc>
"强制干掉esc，让自己用j k退出插入模式
"inoremap <esc> <nop>

"""

""" json 格式化 + 转utf8
"noremap <leader>json :%!python -m json.tool && native2ascii -encoding UTF-8 -reverse % %<CR>
noremap <leader>json :%!python -m json.tool<CR>

"这样选中你要运行的代码<leader>te 就会发到python shell里
nnoremap <leader>te V:call SendToTerminal()<CR>$
vnoremap <leader>te <Esc>:call SendToTerminal()<CR>
function! SendToTerminal()
    let buff_n = term_list()
    if len(buff_n) > 0
        let buff_n = buff_n[0] " sends to most recently opened terminal
        let lines = getline(getpos("'<")[1], getpos("'>")[1])
        let indent = match(lines[0], '[^ \t]') " check for removing unnecessary indent
        for l in lines
            let new_indent = match(l, '[^ \t]')
            if new_indent == 0
                call term_sendkeys(buff_n, l. "\<CR>")
            else
                call term_sendkeys(buff_n, l[indent:]. "\<CR>")
            endif
            sleep 10m
        endfor
    endif
endfunction

""" 真彩色 -测试脚本 https://github.com/JohnMorales/dotfiles/blob/master/colors/24-bit-color.sh
"curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash
set termguicolors
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


" '<-1d | '>+1d  删除块的前一行，和后一行

"""  git左边状态插件配置
" 检查修改间隔时间 ms
set updatetime=100
" 高亮，仿git diff
highlight GitGutterAdd    guifg=#009900 ctermfg=2 ctermbg=39
highlight GitGutterChange guifg=#bbbb00 ctermfg=3 ctermbg=204
highlight GitGutterDelete guifg=#ff2222 ctermfg=1 ctermbg=59


" vim tmux 居中展示风格
let g:tmuxline_preset = 'full'
" 检查tmux环境变量，如果有，就改变vim的底部powerline样式 
if $TMUX != ""
    autocmd VimEnter * Tmuxline powerline
endif


" scala 缩进
let g:scala_scaladoc_indent = 1
