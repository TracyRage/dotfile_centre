" Set leader key
let mapleader = "-"

" Standard settings
syntax on
set smartindent
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
set encoding=utf-8
set history=1000
set ruler
set number
set splitbelow splitright
set hlsearch
set smartcase
set incsearch

" Package manager
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'vim-scripts/quickrun.vim'
Plug 'Raimondi/delimitMate'
Plug 'dpelle/vim-LanguageTool'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ron89/thesaurus_query.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug '~/.fzf/'
"Plug 'vim-pandoc/vim-pandoc'
call plug#end()

"Plug-in key mapping
map <C-n> :NERDTreeToggle<CR>
map <F9> :QuickRun<CR>

"Source .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Comments
nnoremap <leader>c :Comment<CR>

" Cursor option
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" Toggle spellcheck
nnoremap <leader>en :setlocal spell!<CR>

" Ale configuration
let g:ale_completion_enabled = 1
let g:ale_linters = {'python': ["flake8"], 'bash': ["shellcheck"], 'julia': ["languageserver"]}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf'],
\}
let g:ale_fix_on_save = 1

"Onedark settings
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax on
set background=dark
let g:onedark_hide_endofbuffer = 1
colorscheme onedark

" Lightline settings
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


" FZF settings
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Persistent undo
let s:undodir = "/tmp/.undodir_" . $USER
if !isdirectory(s:undodir)
    call mkdir(s:undodir, "", 0700)
endif
let &undodir=s:undodir
set undofile

" Center the Cursor
nnoremap {  {zz
nnoremap }  }zz
nnoremap n  nzz
nnoremap N  Nzz
nnoremap ]c ]czz
nnoremap [c [czz
nnoremap [j <C-o>zz
nnoremap ]j <C-i>zz
nnoremap ]s ]szz
nnoremap [s [szz

" Copy paragraphs
nnoremap cp yap<S-}>p

" Live LATEX setup
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'
let g:livepreview_use_biber = 1
nnoremap <leader>p :LLPStartPreview<CR>
