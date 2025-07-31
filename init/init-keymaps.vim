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
