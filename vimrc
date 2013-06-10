execute pathogen#infect() 
" Use Pathogen to manage plugins.

autocmd vimenter * if !argc() | NERDTree | endif
" Open NERDTree if Vim starts up with no files specified.
map <C-n> :NERDTreeToggle<CR>
" Use Ctrl-N to open/close NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" If the only Vim window still open is NERDTree, close Vim.

syntax enable             " enable syntax highlighting (previously syntax on).
filetype plugin indent on " Use smart indents determined by file type.
set ruler                 " Always show info along bottom.
set laststatus=2          " Always show file name along bottom.
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.

set autoindent            " auto-indent (toggle with ':set paste'/':set unpaste'
set tabstop=2             " tab spacing
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs

set encoding=utf-8
set fileencoding=utf-8
