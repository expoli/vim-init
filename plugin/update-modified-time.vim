"======================================================================
"
" init-modified-time.vim - 自动更新文件头中的Last Modified时间戳（可配置版）
"
" Created by expoli on 2025/04/08
" Last Modified: 2025/04/12 13:51:52
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

" ---------------------- 用户配置区 ----------------------
let g:modified_time_filetypes = ['vim', 'python', 'c', 'cpp']  " 监听的文件类型
let g:modified_time_pattern = 'Last Modified: \d\{4}/\d\{2}/\d\{2} \d\{2}:\d\{2}:\d\{2}'  " 时间戳匹配模式
let g:modified_time_format = "%Y/%m/%d %H:%M:%S"               " 时间格式（strftime格式）
let g:modified_time_search_lines = 10                          " 搜索前N行

" ---------------------- 核心函数 ----------------------
function! UpdateLastModified()
    " 安全检查：空缓冲区或不可写时直接返回
    if line('$') == 0 || !&modifiable
        return
    endif

    " 文件类型检查
    if index(g:modified_time_filetypes, &filetype) == -1
        return  " 当前文件类型不在监听列表中
    endif

    let l:save_cursor = getpos(".")
    let l:last_modified_line = 0

    " 限制搜索行数不超过文件总行数
    let l:max_lines = min([g:modified_time_search_lines, line('$')])

    " 搜索匹配行
    for l:line_num in range(1, l:max_lines)
        let l:line = getline(l:line_num)
        if l:line =~ g:modified_time_pattern
            let l:last_modified_line = l:line_num
        endif
    endfor

    " 更新时间戳
    if l:last_modified_line > 0
        let l:updated_line = substitute(
            \ getline(l:last_modified_line),
            \ '\d\{4}/\d\{2}/\d\{2} \d\{2}:\d\{2}:\d\{2}',
            \ strftime(g:modified_time_format),
            \ ""
        \ )
        call setline(l:last_modified_line, l:updated_line)
    endif

    call setpos(".", l:save_cursor)
endfunction

" ---------------------- 自动触发 ----------------------
" 仅对 g:modified_time_filetypes 定义的文件类型注册 autocmd
augroup AutoUpdateLastModified
    autocmd!
    for filetype in g:modified_time_filetypes
        execute 'autocmd BufWritePre *.' . filetype 'call UpdateLastModified()'
    endfor
augroup END
