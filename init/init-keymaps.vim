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
	autocmd FileType markdown nnoremap <buffer><silent> cl :call SetColor()<CR>
augroup END

function! SetTime()
	call append(line("."), "# ".strftime('%a %d %b %Y'))
endfunction

function! SetTable()
	let l:lnum = line(".")
	call append(l:lnum, "| | | ")
	call append(l:lnum + 1, "|---|---|")
	call append(l:lnum + 2, "| | |")
endfunction

function! SetPic()
	call append(line("."), "<img src='' width=600 alt=''> </img>")
endfunction

function! SetPic1()
	call append(line("."), "![]()")
endfunction

function! SetVideo()
	call append(line("."), "<video src='1.mp4' controls='controls' width='640' height='320'>Your browser does not support the video tag.</video>")
endfunction

function! SetColor()
	call append(line("."), "<span style='color: #f16707;'> </span>")
endfunction

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

"----------------------------------------------------------------------
" Cscope 快捷键（优化：自动加载当前目录/父目录 cscope.out，生成后自动加载）
"----------------------------------------------------------------------
if has("cscope")
    set csprg=/usr/bin/cscope  " 设置 cscope 可执行文件路径
    set cst                    " 启用 cscope 支持（结合 ctags 使用更流畅）
    set cscopequickfix=s-,c-,d-,i-,t-,e-,f-,g-  " 可选：将结果输出到 quickfix 窗口（更易浏览）
    " set csto=0                " 0: 先查 cscope，再查 ctags；1: 先查 ctags
endif

if executable('cscope')
    "----------------------------------------------------------------------
    " 函数：向上查找 cscope.out 文件路径（返回文件路径和 pre-path）
    "----------------------------------------------------------------------
    function! FindCscopeFile()
        let current_dir = fnamemodify(expand('%:p'), ':h')
        let max_depth = 10
        let depth = 0

        while depth <= max_depth
            let cscope_file = current_dir . '/cscope.out'
            if filereadable(cscope_file)
                return [cscope_file, current_dir]
            endif
            let parent_dir = fnamemodify(current_dir, ':h')
            if parent_dir == current_dir
                break
            endif
            let current_dir = parent_dir
            let depth = depth + 1
        endwhile
        return ['', '']
    endfunction

    "----------------------------------------------------------------------
    " 函数：检查 cscope 是否已连接
    "----------------------------------------------------------------------
    function! IsCscopeConnected()
        redir => l:cscope_info
        silent cscope show
        redir END
        return l:cscope_info !~# 'no cscope connections'
    endfunction

    "----------------------------------------------------------------------
    " 函数：查找当前目录及父目录的 cscope.out，找到后加载（避免重复加载）
    "----------------------------------------------------------------------
    function! LoadCscopeDb()
        if IsCscopeConnected()
            return 1
        endif

        let [cscope_file, cscope_dir] = FindCscopeFile()
        if cscope_file != ''
            execute 'cs add ' . fnameescape(cscope_file) . ' ' . fnameescape(cscope_dir)
            echo 'Cscope loaded: ' . cscope_file
            return 1
        endif
        return 0
    endfunction

    "----------------------------------------------------------------------
    " 函数：查找符号（优化：先尝试加载，再查找，支持回退到 ctags）
    "----------------------------------------------------------------------
    function! CscopeFind(type, ...)
        let symbol = a:0 >= 1 ? a:1 : expand('<cword>')
        let cscope_found = 0

        " 尝试加载 cscope 数据库
        if !IsCscopeConnected()
            call LoadCscopeDb()
        endif

        " 如果 cscope 已连接，尝试查找
        if IsCscopeConnected()
            try
                execute 'cs find ' . a:type . ' ' . symbol
                let cscope_found = 1
            catch /^Vim(cscope):E567:/
                " cscope 没找到，记录下来
                let cscope_found = 0
            catch
                " 其他错误
                let cscope_found = 0
            endtry
        endif

        " 如果 cscope 没找到，尝试回退到 ctags
        if !cscope_found
            " 根据查找类型决定是否可以回退到 ctags
            if a:type ==# 'g' || a:type ==# 's'
                " 'g': 全局定义, 's': C符号 -> 可以回退到 tags
                try
                    execute 'tag ' . symbol
                    echohl None
                    return
                catch /^Vim\%((\a\+)\)\=:E426:/
                    " tags 也没找到
                    echohl WarningMsg
                    echo "Not found in cscope or ctags: " . symbol
                    echohl None
                endtry
            elseif a:type ==# 't'
                " 't': 文本字符串 -> 可以回退 to vimgrep
                echohl WarningMsg
                echo "Not found in cscope: " . symbol . ". Try :vimgrep for text search."
                echohl None
            else
                " 其他类型（c:调用者, d:被调用, i:包含, f:文件, a:赋值, e:egrep）
                " ctags 不支持这些查询
                echohl WarningMsg
                echo "Not found in cscope: " . symbol
                echohl None
            endif
        endif
    endfunction

    "----------------------------------------------------------------------
    " 函数：Ctrl+] 增强版 - 自动加载 cscope 后跳转定义，回退到 ctags
    "----------------------------------------------------------------------
    function! CscopeJumpToDefinition()
        let symbol = expand('<cword>')
        let jumped = 0

        " 尝试加载 cscope 数据库
        if !IsCscopeConnected()
            call LoadCscopeDb()
        endif

        " 如果 cscope 已连接，使用 cscope 查找定义
        if IsCscopeConnected()
            try
                " 使用 'g' 查找全局定义
                execute 'cs find g ' . symbol
                let jumped = 1
            catch /^Vim(cscope):E567:/
                " cscope 没找到，继续尝试 tags
                let jumped = 0
            catch
                " 其他错误，继续尝试 tags
                let jumped = 0
            endtry
        endif

        " Fallback: 使用 ctags 跳转
        if !jumped
            try
                execute 'tag ' . symbol
            catch /^Vim\%((\a\+)\)\=:E426:/
                " tags 也没找到
                echohl WarningMsg
                echo "Not found: " . symbol . " (tried cscope and ctags)"
                echohl None
            endtry
        endif
    endfunction

    "----------------------------------------------------------------------
    " 自动命令组：初始化 + 快捷键绑定
    "----------------------------------------------------------------------
    augroup CscopeConfig
        autocmd!

        " 1. Vim 启动时，自动加载 cscope.out（当前目录/父目录）
        autocmd VimEnter * call LoadCscopeDb()

        " 2. 打开 C/C++ 文件时，自动加载 cscope.out
        autocmd FileType c,cpp call LoadCscopeDb()

        " 3. 切换工作目录时，重新加载 cscope.out
        autocmd DirChanged * call LoadCscopeDb()

        " 4. C/C++ 文件快捷键绑定
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>ca :call CscopeFind('a')<cr>  " 查找符号的赋值
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cc :call CscopeFind('c')<cr>  " 查找调用本函数的函数
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cd :call CscopeFind('d')<cr>  " 查找本函数调用的函数
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>ce :call CscopeFind('e')<cr>  " 查找 egrep 模式
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cf :call CscopeFind('f')<cr>  " 查找文件
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cg :call CscopeFind('g')<cr>  " 查找全局定义
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>ci :call CscopeFind('i')<cr>  " 查找包含本文件的文件
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cs :call CscopeFind('s')<cr>  " 查找 C 符号
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>ct :call CscopeFind('t')<cr>  " 查找文本字符串
        autocmd FileType c,cpp nnoremap <buffer><silent> <Leader>cR :call RegenerateCscopeDb()<cr>

        " 5. Ctrl+] 和 Ctrl+\ 快捷键已在全局定义，此处无需重复

    augroup END

    "----------------------------------------------------------------------
    " 函数：重新生成 cscope 数据库
    "----------------------------------------------------------------------
    function! RegenerateCscopeDb()
        let project_root = finddir('.git/..', expand('%:p:h') . ';')
        if project_root == ''
            let project_root = getcwd()
        endif

        let choice = confirm("Regenerate cscope database in: " . project_root . "?", "&Yes\n&No", 2)
        if choice == 1
            execute 'cd ' . fnameescape(project_root)

            " 先断开现有连接
            if IsCscopeConnected()
                cscope kill -1
            endif

            !cscope -b -q -k -R
            call LoadCscopeDb()
            echo "Cscope database regenerated."
        endif
    endfunction

    "----------------------------------------------------------------------
    " 全局快捷键（所有文件类型可用）
    "----------------------------------------------------------------------
    " Ctrl+] 在所有文件类型中也能自动加载 cscope
    nnoremap <silent> <C-]> :call CscopeJumpToDefinition()<cr>
    nnoremap <silent> g<C-]> :call CscopeJumpToDefinition()<cr>

    " Ctrl+\ 快捷方式（全局）
    nnoremap <silent> <C-\>s :call CscopeFind('s')<cr>
    nnoremap <silent> <C-\>g :call CscopeFind('g')<cr>
    nnoremap <silent> <C-\>c :call CscopeFind('c')<cr>
    nnoremap <silent> <C-\>t :call CscopeFind('t')<cr>
    nnoremap <silent> <C-\>e :call CscopeFind('e')<cr>
    nnoremap <silent> <C-\>f :call CscopeFind('f')<cr>
    nnoremap <silent> <C-\>i :call CscopeFind('i')<cr>
    nnoremap <silent> <C-\>d :call CscopeFind('d')<cr>
endif
