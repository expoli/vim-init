# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A lightweight Vim configuration framework with full Chinese comments. This is designed as both a practical configuration and a learning resource for Vim users. The configuration emphasizes simplicity, modularity, and C/C++ development support.

## Installation

```bash
mkdir -p ~/.vim
cd ~/.vim
git clone https://github.com/expoli/vim-init.git .
echo "source ~/.vim/vim-init/init.vim" > ~/.vimrc
```

After installation, run `:PlugInstall` in Vim to install plugins.

## Architecture

The configuration is modular, loaded in this order:

1. `init.vim` - Entry point, sets runtimepath and loads modules
2. `init/init-basic.vim` - Basic settings (compatible with vim-tiny mode)
3. `init/init-config.vim` - Extended settings (requires +eval)
4. `init/init-tabsize.vim` - Tab/indentation settings and conversions
5. `init/init-plugins.vim` - Plugin management via vim-plug
6. `init/init-style.vim` - UI/colorscheme settings
7. `init/init-keymaps.vim` - Key mappings

## Key Conventions

- **Leader key**: Space (` `)
- **LocalLeader**: `,`
- **Encoding**: UTF-8 with fallback chain (ucs-bom, utf-8, gbk, cp936, gb18030, big5, euc-jp, euc-kr, latin1)
- **Color scheme**: molokai (dark background, 256 colors)

## Plugin System

### Plugin Groups

Defined in `g:bundle_group`, default groups:
- `basic` - Core plugins (startify, colorschemes, signify, fugitive, etc.)
- `tags` - Automatic ctags/gtags generation (gutentags, gutentags_plus)
- `enhanced` - Enhanced editing (expand-region, fzf, delimitMate)
- `filetypes` - File type support (cpp-enhanced-highlight, python-syntax, rust.vim)
- `textobj` - Text objects (indent, syntax, function, parameter, uri)
- `airline` - Status line
- `nerdtree` - File explorer
- `echodoc` - Function parameter display
- `leaderf` - Fuzzy finder (requires Python)

### Lazy Loading

Plugins are lazy-loaded on `InsertLeave` for faster startup. See `s:LoadLazyPlugins()` in `init-plugins.vim`.

### Built-in Plugins

The `plugin/` directory contains standalone plugins that work offline:
- `asyncrun.vim` - Async command execution
- `asynctasks.vim` - Task management
- `commentary.vim` - Comment toggling
- `unimpaired.vim` - Bracket mappings
- `indent-object.vim` - Indent text objects
- `argtextobj.vim` - Argument text objects

## Important Keymaps

### File/Buffer Navigation
- `<Space>1-0` / `<M-1-0>` - Switch to tab 1-10
- `<Space>bn/bp` - Next/previous buffer
- `<Space>tc/tq/tn/tp/to` - Tab create/close/next/prev/only
- `<C-p>` - LeaderF file fuzzy match
- `<C-n>` - LeaderF MRU files
- `<M-p>` - LeaderF function list
- `<M-n>` - LeaderF buffer list
- `<F3>` - Toggle NERDTree

### Window Navigation
- `<Space>gs` - Cycle through split windows
- `<Space>h/j/k/l` - Move to window left/down/up/right
- `<Space>s` - Horizontal split
- `<Space>v` - Vertical split

### Indentation (init-tabsize.vim)
- `<Space>te` - Toggle expandtab (spaces vs tabs)
- `<Space>ts` - Set tab size (2/4/8)
- `<Space>tr` - Convert all tabs to 4 spaces
- `<Space>tt` - Convert leading 4 spaces to tabs
- `<Space>ti` - Show current indent config

### C/C++ Development
- `<F4>` - Compile current C/C++ file
- `<F5>` - Run current file
- `<F6>` - CMake project
- `<F7>` - Make project
- `<F8>` - Make run
- `<F10>` - Toggle quickfix window
- `<F2>` - Grep word under cursor (using rg or grep)

### Cscope (for C/C++)
- `<Space>ca/cc/cd/ce/cf/cg/ci/cs/ct` - Various cscope find commands
- `<Space>cR` - Regenerate cscope database

## Development Workflow

### Reloading Configuration

After editing any `.vim` config file:
```vim
:so %
```
This reloads the current script.

### Adding New Plugins

1. Add `Plug 'author/plugin-name'` in `init-plugins.vim`
2. Add configuration below the Plug statement
3. Run `:PlugInstall`

### Modifying Keymaps

Edit `init/init-keymaps.vim`. Most mappings are organized by category with Chinese comments.

## Project Root Detection

The configuration looks for these markers to identify project root:
- `.root` (empty file you can create)
- `.project`
- `.svn`
- `.git`

This is used by gutentags, LeaderF, and asyncrun for project-aware operations.

## Tags Database Location

Tags are stored centrally at `~/.cache/tags/` to avoid polluting project directories.

## File Type Specific Settings

Defined in autocommand groups:
- C/C++: tab size 4, no expandtab, `//` comments
- Python: tab size 4, expandtab
- YAML/JSON/Markdown/XML/HTML: tab size 2, expandtab
- Make: tab size 8, no expandtab (required by Make)
- Go: tab size 4, no expandtab
