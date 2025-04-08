"======================================================================
"
" init-modified-time.vim - 自动更新文件头中的Last Modified的字段值
"
" Created by expoli on 2025/04/08
" Last Modified: 2025/04/08 11:40:50
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

function! UpdateLastModified()
    let l:save_cursor = getpos(".")  " 保存光标位置
    let l:last_modified_line = 0

    " 搜索前20行内符合时间戳格式的行
    for l:line_num in range(1, 20)
        let l:line = getline(l:line_num)
        " 严格匹配 'Last Modified: 20XX/XX/XX XX:XX:XX' 格式
        if l:line =~ '" Last Modified: \d\{4}/\d\{2}/\d\{2} \d\{2}:\d\{2}:\d\{2}'
            let l:last_modified_line = l:line_num
        endif
    endfor

    " 更新最后一个匹配的行
    if l:last_modified_line > 0
        let l:updated_line = substitute(
            \ getline(l:last_modified_line),
            \ '\d\{4}/\d\{2}/\d\{2} \d\{2}:\d\{2}:\d\{2}',
            \ strftime("%Y/%m/%d %H:%M:%S"),
            \ ""
        \ )
        call setline(l:last_modified_line, l:updated_line)
    endif

    call setpos(".", l:save_cursor)  " 恢复光标位置
endfunction

autocmd BufWritePre *.vim call UpdateLastModified()
