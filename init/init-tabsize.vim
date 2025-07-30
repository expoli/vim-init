"======================================================================
"
" init-tabsize.vim - 大部分人对 tabsize 都有自己的设置，改这里即可
"
" Created by skywind on 2018/05/30
" Last Modified: 2025/06/19 13:59:15
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------

" 设置缩进宽度
set sw=4

" 设置 TAB 宽度
set ts=4

" 如果后面设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4

" 禁止展开 tab (noexpandtab)
set noet
" 将 Tab 转换为空格
" set expandtab

augroup PythonTab
	au!
	" 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
	" 时自动设置成空格缩进。
	au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END

augroup YamlTab
    au!
    " 针对 YAML 文件，禁用 expandtab，使用真正的 Tab
    au FileType yaml setlocal shiftwidth=2 tabstop=2 noexpandtab
augroup END

augroup MakefileTab
    au!
    " Makefile 必须使用真正的 Tab，不能展开为空格
    au FileType make setlocal noexpandtab shiftwidth=8 tabstop=8
augroup END

