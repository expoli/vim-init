"======================================================================
"
" init-add-file-header.vim - 支持手动添加自定义文件头信息 ah 快捷键
"
" Created by tcy on 2025/04/08 13:40:45
" Last Modified: 2025/04/08 13:51:05
"
"======================================================================

function! AddFileHeader()
    let l:filetype = &filetype
    let l:filename = expand('%:t')
    let l:date = strftime("%Y/%m/%d %H:%M:%S")
    let l:user = $USER

    " 根据文件类型设置注释符号和模板
    if l:filetype == 'vim'
        let l:comment = '"'
        let l:template = [
            \ l:comment . '======================================================================',
            \ l:comment,
            \ l:comment . ' ' . l:filename . ' - 文件描述',
            \ l:comment,
            \ l:comment . ' Created by ' . l:user . ' on ' . l:date,
            \ l:comment . ' Last Modified: ' . l:date,
            \ l:comment,
            \ l:comment . '======================================================================',
            \ ''
        \ ]
    elseif l:filetype == 'python'
        let l:comment = '#'
        let l:template = [
            \ '#!/usr/bin/env python3',
            \ l:comment . ' -*- coding: utf-8 -*-',
            \ l:comment . '',
            \ l:comment . ' ' . l:filename . ' - 文件描述',
            \ l:comment . '',
            \ l:comment . ' Created by ' . l:user . ' on ' . l:date,
            \ l:comment . ' Last Modified: ' . l:date,
            \ l:comment . '',
            \ ''
        \ ]
    elseif l:filetype == 'sh'
        let l:comment = '#'
        let l:template = [
            \ '#!/usr/bin/env bash',
            \ l:comment . '',
            \ l:comment . ' ' . l:filename . ' - 文件描述',
            \ l:comment . '',
            \ l:comment . ' Created by ' . l:user . ' on ' . l:date,
            \ l:comment . ' Last Modified: ' . l:date,
            \ l:comment . '',
            \ ''
        \ ]
    elseif l:filetype == 'c' || l:filetype == 'cpp'
        let l:comment = '//'
        let l:template = [
            \ '/***********************************************************************',
            \ ' *',
            \ ' * ' . l:filename . ' - 文件描述',
            \ ' *',
            \ ' * Created by ' . l:user . ' on ' . l:date,
            \ ' * Last Modified: ' . l:date,
            \ ' *',
            \ ' **********************************************************************/',
            \ ''
        \ ]
    else
        " 默认模板（适用于其他文件类型）
        let l:comment = '#'
        let l:template = [
            \ l:comment . '===========================================',
            \ l:comment . ' ' . l:filename . ' - 文件描述',
            \ l:comment . ' Created: ' . l:date,
            \ l:comment . ' Modified: ' . l:date,
            \ l:comment . '===========================================',
            \ ''
        \ ]
    endif

    " 插入模板并定位到描述行
    call append(0, l:template)
    " 定位到文件描述位置方便编辑
    call cursor(3, 0)
    call search('文件描述')
    startinsert!
endfunction

" 定义命令和快捷键
command! AddHeader call AddFileHeader()
nnoremap <Leader>ah :AddHeader<CR>
