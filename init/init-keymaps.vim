"======================================================================
" init-keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"   - 编译运行
"   - 符号搜索
"
" Created by skywind on 2018/05/30
" Last Modified: 2025/07/30 17:59:31
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 自定义快捷键的前缀，即<Leader>
"----------------------------------------------------------------------
let mapleader=";"

"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
"inoremap <c-a> <home>
"inoremap <c-e> <end>
"inoremap <c-d> <del>
"inoremap <c-_> <c-k>

"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" <leader>+数字键 切换tab
"----------------------------------------------------------------------
function! s:SetupKeymaps()
    if exists('g:keymaps_setup')
        return
    endif
    let g:keymaps_setup = 1

    noremap <silent><leader>1 1gt<cr>
    noremap <silent><leader>2 2gt<cr>
    noremap <silent><leader>3 3gt<cr>
    noremap <silent><leader>4 4gt<cr>
    noremap <silent><leader>5 5gt<cr>
    noremap <silent><leader>6 6gt<cr>
    noremap <silent><leader>7 7gt<cr>
    noremap <silent><leader>8 8gt<cr>
    noremap <silent><leader>9 9gt<cr>
    noremap <silent><leader>0 10gt<cr>

    noremap <silent><m-1> :tabn 1<cr>
    noremap <silent><m-2> :tabn 2<cr>
    noremap <silent><m-3> :tabn 3<cr>
    noremap <silent><m-4> :tabn 4<cr>
    noremap <silent><m-5> :tabn 5<cr>
    noremap <silent><m-6> :tabn 6<cr>
    noremap <silent><m-7> :tabn 7<cr>
    noremap <silent><m-8> :tabn 8<cr>
    noremap <silent><m-9> :tabn 9<cr>
    noremap <silent><m-0> :tabn 10<cr>
    inoremap <silent><m-1> <ESC>:tabn 1<cr>
    inoremap <silent><m-2> <ESC>:tabn 2<cr>
    inoremap <silent><m-3> <ESC>:tabn 3<cr>
    inoremap <silent><m-4> <ESC>:tabn 4<cr>
    inoremap <silent><m-5> <ESC>:tabn 5<cr>
    inoremap <silent><m-6> <ESC>:tabn 6<cr>
    inoremap <silent><m-7> <ESC>:tabn 7<cr>
    inoremap <silent><m-8> <ESC>:tabn 8<cr>
    inoremap <silent><m-9> <ESC>:tabn 9<cr>
    inoremap <silent><m-0> <ESC>:tabn 10<cr>

    if has("gui_macvim")
        set macmeta
        noremap <silent><d-1> :tabn 1<cr>
        noremap <silent><d-2> :tabn 2<cr>
        noremap <silent><d-3> :tabn 3<cr>
        noremap <silent><d-4> :tabn 4<cr>
        noremap <silent><d-5> :tabn 5<cr>
        noremap <silent><d-6> :tabn 6<cr>
        noremap <silent><d-7> :tabn 7<cr>
        noremap <silent><d-8> :tabn 8<cr>
        noremap <silent><d-9> :tabn 9<cr>
        noremap <silent><d-0> :tabn 10<cr>
        inoremap <silent><d-1> <ESC>:tabn 1<cr>
        inoremap <silent><d-2> <ESC>:tabn 2<cr>
        inoremap <silent><d-3> <ESC>:tabn 3<cr>
        inoremap <silent><d-4> <ESC>:tabn 4<cr>
        inoremap <silent><d-5> <ESC>:tabn 5<cr>
        inoremap <silent><d-6> <ESC>:tabn 6<cr>
        inoremap <silent><d-7> <ESC>:tabn 7<cr>
        inoremap <silent><d-8> <ESC>:tabn 8<cr>
        inoremap <silent><d-9> <ESC>:tabn 9<cr>
        inoremap <silent><d-0> <ESC>:tabn 10<cr>
    endif

    noremap <silent> <leader>bn :bn<cr>
    noremap <silent> <leader>bp :bp<cr>

    noremap <silent> <leader>tc :tabnew<cr>
    noremap <silent> <leader>tq :tabclose<cr>
    noremap <silent> <leader>tn :tabnext<cr>
    noremap <silent> <leader>tp :tabprev<cr>
    noremap <silent> <leader>to :tabonly<cr>

    noremap <silent><m-left> :call Tab_MoveLeft()<cr>
    noremap <silent><m-right> :call Tab_MoveRight()<cr>

    noremap <m-h> b
    noremap <m-l> w
    inoremap <m-h> <c-left>
    inoremap <m-l> <c-right>

    nnoremap <m-j> gj
    nnoremap <m-k> gk
    inoremap <m-j> <c-\><c-o>gj
    inoremap <m-k> <c-\><c-o>gk

    cnoremap <m-h> <c-left>
    cnoremap <m-l> <c-right>

    nnoremap <m-y> d$
    inoremap <m-y> <c-\><c-o>d$

    nnoremap <Leader>gs <C-W><C-W>
    nnoremap <leader>h <C-W><C-H>
    nnoremap <leader>l <C-W><C-L>
    nnoremap <Leader>k <C-W><C-K>
    nnoremap <Leader>j <C-W><C-J>

    nmap <Leader>s :Sex<CR>
    nmap <Leader>v :Vex<CR>

    nmap <Leader>u <C-U>
    nmap <Leader>d <C-D>

    nmap <Leader>e :e<Space>
    nmap <Leader>z <C-Z>
endfunction

augroup KeymapsLazyLoad
    autocmd!
    autocmd InsertLeave * call s:SetupKeymaps()
augroup END

"----------------------------------------------------------------------
" 编译运行 C/C++ 项目
" 详细见：http://www.skywind.me/blog/archives/2084
"----------------------------------------------------------------------

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 定义一组通用的编程/脚本语言文件类型
let s:exec_ft = 'c,cpp,python,go,rust,javascript,perl,ruby,php,lua,zsh,ps1,vbs,sh'
" 定义一组用于 Grep 的文件类型
let s:grep_ft = 'c,cpp,python,javascript,vim'

augroup ProgrammingKeymaps
    autocmd!

    " F10: 打开/关闭 Quickfix 窗口
    exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F10> :call asyncrun#quickfix_toggle(6)<cr>"
    " F5: 运行当前文件
    exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F5> :call ExecuteFile()<cr>"
    " F7: 编译项目 (make)
    exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F7> :AsyncRun -cwd=<root> make <cr>"
    " F8: 运行项目 (make run)
    exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>"
    " F6: 测试项目 (make test)
    exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>"

    " F9: 编译 C/C++ 单个文件
    autocmd FileType c,cpp nnoremap <buffer><silent> <F9> :AsyncRun gcc -Wall -O2 \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\" <cr>"

    " F4: 更新 CMake 项目
    autocmd FileType c,cpp,cmake nnoremap <buffer><silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>"

    " Windows 下的特殊设置: F8 在新窗口中运行
    if has('win32') || has('win64')
        exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>"
    endif

    " F2: 在项目目录下 Grep 光标下的单词
    if executable('rg')
        exec "autocmd FileType " . s:grep_ft . " nnoremap <buffer><silent><F2> :AsyncRun! -cwd=<root> rg -n --no-heading " .
            \ " --color never -g *.h -g *.c* -g *.py -g *.js -g *.vim " .
            \ " <C-R><C-W> \"<root>\" <cr>"
    elseif has('win32') || has('win64')
        exec "autocmd FileType " . s:grep_ft . " nnoremap <buffer><silent><F2> :AsyncRun! -cwd=<root> findstr /n /s /C:\"<C-R><C-W>\" " .
            \ " \"\\%CD\\%\\*.h\" \"\\%CD\\%\\*.c*\" \"\\%CD\\%\\*.py\" \"\\%CD\\%\\*.js\" \"\\%CD\\%\\*.vim\" <cr>"
    else
        let s:grep_cmd = "autocmd FileType " . s:grep_ft . " nnoremap <buffer><silent><F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W>"
        let s:grep_cmd .= " --include='*.h' --include='*.c*' --include='*.py'"
        let s:grep_cmd .= " --include='*.js' --include='*.vim\' '<root>' <cr>"
        exec s:grep_cmd
    endif
augroup END

"----------------------------------------------------------------------
" F5 运行当前文件：根据文件类型判断方法，并且输出到 quickfix 窗口
"----------------------------------------------------------------------
function! ExecuteFile()
	let cmd = ''
	if index(['c', 'cpp', 'rs', 'go'], &ft) >= 0
		" native 语言，把当前文件名去掉扩展名后作为可执行运行
		" 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
		" 加双引号是为了避免路径中包含空格
		let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif &ft == 'python'
		let $PYTHONUNBUFFERED=1 " 关闭 python 缓存，实时看到输出
		let cmd = 'python "$(VIM_FILEPATH)"'
	elseif &ft == 'javascript'
		let cmd = 'node "$(VIM_FILEPATH)"'
	elseif &ft == 'perl'
		let cmd = 'perl "$(VIM_FILEPATH)"'
	elseif &ft == 'ruby'
		let cmd = 'ruby "$(VIM_FILEPATH)"'
	elseif &ft == 'php'
		let cmd = 'php "$(VIM_FILEPATH)"'
	elseif &ft == 'lua'
		let cmd = 'lua "$(VIM_FILEPATH)"'
	elseif &ft == 'zsh'
		let cmd = 'zsh "$(VIM_FILEPATH)"'
	elseif &ft == 'ps1'
		let cmd = 'powershell -file "$(VIM_FILEPATH)"'
	elseif &ft == 'vbs'
		let cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
	elseif &ft == 'sh'
		let cmd = 'bash "$(VIM_FILEPATH)"'
	else
		return
	endif
	" Windows 下打开新的窗口 (-mode=4) 运行程序，其他系统在 quickfix 运行
	" -raw: 输出内容直接显示到 quickfix window 不匹配 errorformat
	" -save=2: 保存所有改动过的文件
	" -cwd=$(VIM_FILEDIR): 运行初始化目录为文件所在目录
	if has('win32') || has('win64')
		exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=4 '. cmd
	else
		exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=0 '. cmd
	endif
endfunc


"----------------------------------------------------------------------
" markdown 的一些快捷键
"----------------------------------------------------------------------
augroup MarkdownKeymaps
    autocmd!
    autocmd FileType markdown nnoremap <buffer><silent> tm :call SetTime()<CR>
    autocmd FileType markdown nnoremap <buffer><silent> tb :call SetTable()<CR>
    autocmd FileType markdown nnoremap <buffer><silent> pc :call SetPic()<CR>
    autocmd FileType markdown nnoremap <buffer><silent> pi :call SetPic1()<CR>
    autocmd FileType markdown nnoremap <buffer><silent> vi :call SetVideo()<CR>
    autocmd FileType markdown nnoremap <buffer><silent> cl :call SetCollor()<CR>
augroup END

func SetTime()
        call append(line("."), "# ".strftime('%a %d %b %Y'))
endfunc

func SetTable()
        call append(line(".")+0, "| | | ")
        call append(line(".")+1, "|---|---|")
        call append(line(".")+2, "| | |")
endfunc

func SetPic()
        call append(line("."), "<img src='' width=600 alt=''> </img></div>")
endfunc

func SetPic1()
        call append(line("."), "![]()")
endfunc

func SetVideo()
        call append(line("."), "<video src='1.mp4' controls='controls' width='640' height='320' autoplay='autoplay'> Your browser does not support the video tag.</div>")
endfunc

func SetCollor()
        call append(line("."), "<span  style='color: #f16707;'> </span>")
endfunc

"----------------------------------------------------------------------
" 快捷键窗口操作
"----------------------------------------------------------------------
" 设置快捷键gs遍历各分割窗口。快捷键速记法：goto the next spilt window
nnoremap <Leader>gs <C-W><C-W>

" 向左
nnoremap <leader>h <C-W><C-H>

" 向右
nnoremap <leader>l <C-W><C-L>

" 向上
nnoremap <Leader>k <C-W><C-K>

" 向下
nnoremap <Leader>j <C-W><C-J>

" 水平分隔
nmap <Leader>s :Sex<CR>

" 竖直分隔
nmap <Leader>v :Vex<CR>

" 向下翻半屏
nmap <Leader>u <C-U>

" 向上翻半屏
nmap <Leader>d <C-D>

"----------------------------------------------------------------------
" 文件快速键操作
"----------------------------------------------------------------------
" 打开文件
nmap <Leader>e :e<Space>

" 不关闭文件推出
nmap <Leader>z <C-Z>

" 快速切换C H源文件
augroup CppKeymaps
    autocmd!
    autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>a :A<CR>
augroup END
