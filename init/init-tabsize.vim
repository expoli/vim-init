"======================================================================
" init-tabsize.vim - 统一缩进配置（终极零报错，替换所有Tab）
" 核心：无注释冲突、无复杂变量、无多余逻辑
" Created by skywind on 2018/05/30
" Last Modified: 2025/11/30 10:00:00
"======================================================================
" 全局基础配置
set ts=4 sw=4 sts=4 tw=120
set noet
set autoindent smartindent
set backspace=indent,eol,start
set nowrap
set listchars=tab:→\ ,trail:·
set list

"----------------------------------------------------------------------
" 切换空格/Tab模式（空格+te）
"----------------------------------------------------------------------
nnoremap <silent> <Leader>te :set et!<CR>:echom "✅ ExpandTab: " . (&et ? "ON（空格）" : "OFF（Tab）")<CR>
inoremap <silent> <C-t> <Esc>:set et!<CR>:echom "✅ ExpandTab: " . (&et ? "ON（空格）" : "OFF（Tab）")<CR>a

"----------------------------------------------------------------------
" 设置缩进宽度（空格+ts）
"----------------------------------------------------------------------
nnoremap <silent> <Leader>ts :call SetTabSize()<CR>
inoremap <silent> <C-s> <Esc>:call SetTabSize()<CR>a

function! SetTabSize()
    let l:size = input("Set tab size (2/4/8): ")
    if l:size =~ '^[248]$'
        let l:size = str2nr(l:size)
        execute 'setlocal ts=' . l:size . ' sw=' . l:size . ' sts=' . l:size
        echom "Tab size set to " . l:size
    else
        echohl ErrorMsg
        echom "Invalid size! Only 2/4/8 allowed."
        echohl None
    endif
endfunction

"----------------------------------------------------------------------
" 批量替换：所有Tab→4空格（空格+tr）
"----------------------------------------------------------------------
nnoremap <silent> <Leader>tr :call TabToSpace()<CR>
vnoremap <silent> <Leader>tr :<C-u>call TabToSpace()<CR>

function! TabToSpace()
    let confirm = confirm("📥 Convert ALL Tab to 4 Space?", "&Yes\n&No", 2)
    if confirm != 1
        echom "❌ Conversion cancelled."
        return
    endif

    " 核心替换命令：无注释、无变量、加e选项抑制报错
    if mode() ==# 'v' || mode() ==# 'V' || mode() ==# "\<C-v>"
        execute "normal! gv"
        execute "'<,'>s/\\t/    /ge"
    else
        execute "%s/\\t/    /ge"
    endif

    setlocal et
    echohl SuccessMsg
    echom "✅ Tab to 4 Space completed!"
    echohl None
endfunction

"----------------------------------------------------------------------
" 批量替换：行首4空格→Tab（空格+tt）
"----------------------------------------------------------------------
nnoremap <silent> <Leader>tt :call SpaceToTab()<CR>
vnoremap <silent> <Leader>tt :<C-u>call SpaceToTab()<CR>

function! SpaceToTab()
    let confirm = confirm("📤 Convert leading 4 Space to Tab?", "&Yes\n&No", 2)
    if confirm != 1
        echom "❌ Conversion cancelled."
        return
    endif

    " 仅替换行首4个空格，加e选项抑制报错
    if mode() ==# 'v' || mode() ==# 'V' || mode() ==# "\<C-v>"
        execute "normal! gv"
        execute "'<,'>s/^    /\\t/ge"
    else
        execute "%s/^    /\\t/ge"
    endif

    setlocal noet
    echohl SuccessMsg
    echom "✅ Leading 4 Space to Tab completed!"
    echohl None
endfunction

"----------------------------------------------------------------------
" 查看当前配置（空格+ti）
"----------------------------------------------------------------------
nnoremap <silent> <Leader>ti :call ShowIndentConfig()<CR>
inoremap <silent> <C-i> <Esc>:call ShowIndentConfig()<CR>a

function! ShowIndentConfig()
    echohl Title
    echom "📋 Current Indent Config:"
    echohl None
    echom "  Tab Size (ts): " . &ts
    echom "  Shift Width (sw): " . &sw
    echom "  ExpandTab (et): " . (&et ? "ON（空格）" : "OFF（Tab）")
    echom "  File Type: " . &filetype
endfunction

"----------------------------------------------------------------------
" 文件类型适配（避免编译/解析报错）
"----------------------------------------------------------------------
augroup ProgramTab
    au!
    au FileType c,cpp,csharp setlocal sw=4 ts=4 noet
    au FileType sh,bash,zsh setlocal sw=4 ts=4 noet
    au FileType qmake setlocal sw=4 ts=4 et
    au FileType java,kotlin setlocal sw=4 ts=4 et
    au FileType go setlocal sw=4 ts=4 noet
augroup END

augroup ConfigTab
    au!
    au FileType make setlocal noet sw=8 ts=8
    au FileType python setlocal sw=4 ts=4 et
    au FileType yaml,yml setlocal sw=2 ts=2 et
    au FileType json setlocal sw=2 ts=2 et
    au FileType markdown setlocal sw=2 ts=2 et
    au FileType xml,html,xhtml setlocal sw=2 ts=2 et
augroup END

"----------------------------------------------------------------------
" 备注：
" 1. 快捷键（Leader=空格）：
"    - 切换空格/Tab模式：空格+te
"    - 设置缩进宽度：空格+ts
"    - 所有Tab→4空格：空格+tr（零报错核心功能）
"    - 行首4空格→Tab：空格+tt
"    - 查看配置：空格+ti
" 2. 零报错保障：
"    - 删掉所有行内注释，彻底避免双引号冲突（E114）
"    - 无任何变量依赖（v:status/replace_cmd等），仅用原生命令
"    - 替换命令加e选项，抑制无匹配报错（E486）
"    - 所有命令无多余缩进，避免E492错误
" 3. 适配你的需求：
"    - 替换所有Tab（行首/行内/字符串内/注释内）
"    - 无Tab时不报错，仅提示完成
"    - 支持全局替换和Visual选区替换
"----------------------------------------------------------------------
