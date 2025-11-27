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
let mapleader = ' '  " 全局 Leader 键设为空格
let maplocalleader = ','  " 局部 Leader 键（备用，不冲突）

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
"noremap <C-h> <left>
"noremap <C-j> <down>
"noremap <C-k> <up>
"noremap <C-l> <right>
"inoremap <C-h> <left>
"inoremap <C-j> <down>
"inoremap <C-k> <up>
"inoremap <C-l> <right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
"cnoremap <c-h> <left>
"cnoremap <c-j> <down>
"cnoremap <c-k> <up>
"cnoremap <c-l> <right>
"cnoremap <c-a> <home>
"cnoremap <c-e> <end>
"cnoremap <c-f> <c-d>
"cnoremap <c-b> <left>
"cnoremap <c-d> <del>
"cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" <leader>+数字键 切换tab (Eagerly Loaded)
"----------------------------------------------------------------------
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


"----------------------------------------------------------------------
" ALT+N 切换 tab (Eagerly Loaded)
"----------------------------------------------------------------------
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


" MacVim 允许 CMD+数字键快速切换标签 (Eagerly Loaded)
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



"----------------------------------------------------------------------
" 缓存：插件 unimpaired 中定义了 [b, ]b 来切换缓存 (Eagerly Loaded)
"----------------------------------------------------------------------
noremap <silent> <leader>bn :bn<cr>
noremap <silent> <leader>bp :bp<cr>


"----------------------------------------------------------------------
" TAB：创建，关闭，上一个，下一个，左移，右移 (Eagerly Loaded)
" 其实还可以用原生的 CTRL+PageUp, CTRL+PageDown 来切换标签
"----------------------------------------------------------------------

noremap <silent> <leader>tc :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>
noremap <silent> <leader>to :tabonly<cr>


" 左移 tab
function! Tab_MoveLeft()
	let l:tabnr = tabpagenr() - 2
	if l:tabnr >= 0
		exec 'tabmove '.l:tabnr
	endif
endfunc

" 右移 tab
function! Tab_MoveRight()
	let l:tabnr = tabpagenr() + 1
	if l:tabnr <= tabpagenr('$')
		exec 'tabmove '.l:tabnr
	endif
endfunc

"noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
"noremap <silent><leader>tr :call Tab_MoveRight()<cr>
noremap <silent><m-left> :call Tab_MoveLeft()<cr>
noremap <silent><m-right> :call Tab_MoveRight()<cr>


"----------------------------------------------------------------------
" ALT 键移动增强 (Eagerly Loaded)
"----------------------------------------------------------------------

" ALT+h/l 快速左右按单词移动（正常模式+插入模式）
noremap <m-h> b
noremap <m-l> w
inoremap <m-h> <c-left>
inoremap <m-l> <c-right>

" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转）
noremap <m-j> gj
noremap <m-k> gk
inoremap <m-j> <c-\><c-o>gj
inoremap <m-k> <c-\><c-o>gk

" 命令模式下的相同快捷
cnoremap <m-h> <c-left>
cnoremap <m-l> <c-right>

" ALT+y 删除到行末
noremap <m-y> d$
inoremap <m-y> <c-\><c-o>d$


"----------------------------------------------------------------------
" 快捷键窗口操作 (Eagerly Loaded)
"----------------------------------------------------------------------
" 设置快捷键gs遍历各分割窗口。快捷键速记法：goto the next spilt window
nnoremap <Leader>gs <C-W><C-W>

" 向左
nnoremap <leader>h <C-W><C-H>

" 向右
noremap <leader>l <C-W><C-L>

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

	" F4: 编译 C/C++ 单个文件
	autocmd FileType c nnoremap <buffer><silent> <F4> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>"
    autocmd FileType cpp nnoremap <buffer><silent> <F4> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>"
	" F5: 运行当前文件
	exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F5> :call ExecuteFile()<cr>"
	" F6: 更新 CMake 项目
	autocmd FileType c,cpp,cmake nnoremap <buffer><silent> <F6> :AsyncRun -cwd=<root> cmake . <cr>"
	" F7: 编译项目 (make)
	exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F7> :AsyncRun -cwd=<root> make <cr>"
	" F8: 运行项目 (make run)
	" Windows 下的特殊设置: F8 在新窗口中运行
	if has('win32') || has('win64')
		exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>"
	else
	    exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>"
	endif
	" F9: 测试项目 (make test)
	"exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F9> :AsyncRun -cwd=<root> -raw make test <cr>"
	" F10: 打开/关闭 Quickfix 窗口
	exec "autocmd FileType " . s:exec_ft . " nnoremap <buffer><silent> <F10> :call asyncrun#quickfix_toggle(6)<cr>"

	" F2: 在项目目录下 Grep 光标下的单词
	if executable('rg')
		exec "autocmd FileType " . s:grep_ft . " nnoremap <buffer><silent><F2> :AsyncRun! -cwd=<root> rg -n --no-heading " .
			\ " --color never -g '*.h' -g '*.c*' -g '*.py' -g '*.js' -g '*.vim' " .
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
" 快捷键窗口操作 (Eagerly Loaded)
"----------------------------------------------------------------------
" 设置快捷键gs遍历各分割窗口。快捷键速记法：goto the next spilt window
nnoremap <Leader>gs <C-W><C-W>

" 向左
nnoremap <Leader>h <C-W><C-H>

" 向右
noremap <Leader>l <C-W><C-L>

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
" 行号操作 (Eagerly Loaded)
"----------------------------------------------------------------------
" 定义联动函数：根据行号状态同步 signcolumn
function! UpdateSignColumn()
  " 判断行号是否开启（只要绝对行号或相对行号有一个开启，就认为行号是开启状态）
  if &number || &relativenumber
    " 行号开启时，开启 signcolumn（设为 auto：有标记显示列，无标记时列宽最小，避免排版跳动）
    set signcolumn=auto
  else
    " 行号关闭时，彻底关闭 signcolumn（消除空白列）
    set signcolumn=no
  endif
endfunction

" 1. 监听行号选项变化：当 number 或 relativenumber 改变时，自动调用联动函数
autocmd OptionSet number,relativenumber call UpdateSignColumn()

" 2. Vim 启动时，初始化 signcolumn（确保启动时状态一致）
autocmd VimEnter * call UpdateSignColumn()

" 可选：添加一键切换行号的命令（方便快速测试，可自定义快捷键）
command! ToggleNumber :set number! relativenumber!

"----------------------------------------------------------------------
" 文件快速键操作 (Eagerly Loaded)
"----------------------------------------------------------------------
" 打开文件
nmap <Leader>e :e<Space>

" 不关闭文件推出
nmap <Leader>z <C-Z>

" 快速切换C H源文件
"augroup CppKeymaps
"	autocmd!
"	autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>a :A<CR>
"augroup END

if has("cscope")
	set csprg=/usr/bin/cscope  " 设置 cscope 的路径
	set cst                    " 启用 cscope 支持
	" 加载 cscope 数据库（如果你在项目中已经生成了 cscope.out）
	cs add /path/to/cscope.out
endif


"----------------------------------------------------------------------
" Cscope 快捷键
"----------------------------------------------------------------------
if executable('cscope')
	function! CscopeFind(type)
		if !filereadable('cscope.out')
			echo "cscope.out not found. Generating new database..."
			!cscope -b -q -k -R
			echo "Cscope database generated."
		endif
		execute 'cs find ' . a:type . ' ' . expand('<cword>')
	endfunction

	augroup CscopeKeymaps
		autocmd!
		" <Leader>ca (查找符号的赋值)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>ca :call CscopeFind('a')<cr>
		" <Leader>cc (查找调用本函数的函数)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cc :call CscopeFind('c')<cr>
		" <Leader>cd (查找本函数调用的函数)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cd :call CscopeFind('d')<cr>
		" <Leader>ce (查找egrep模式)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>ce :call CscopeFind('e')<cr>
		" <Leader>cf (查找文件)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cf :call CscopeFind('f')<cr>
		" <Leader>cg (查找全局定义)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cg :call CscopeFind('g')<cr>
		" <Leader>ci (查找包含本文件的文件)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>ci :call CscopeFind('i')<cr>
		" <Leader>cs (查找C符号)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cs :call CscopeFind('s')<cr>
		" <Leader>ct (查找文本字符串)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>ct :call CscopeFind('t')<cr>
		" <Leader>cR (重新生成cscope数据库)
		autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cR :!cscope -b -q -k -R<cr>
	augroup END
endif
