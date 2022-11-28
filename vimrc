set nocompatible

" Should be installed these packages:
" curl git python3 node npm
" coc-extension:
" :CocInstall coc-nav coc-snippets @yaegassy/coc-tailwindcss3 coc-tsserver coc-emmet coc-terminal

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'tomasiser/vim-code-dark'
Plug 'kien/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'othree/xml.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/matchit.zip'
"Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'valloric/matchtagalways'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'vim-scripts/restore_view.vim'
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'powerline/powerline'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'AndrewRadev/tagalong.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'ap/vim-css-color'
Plug 'Galooshi/vim-import-js', { 'do': 'npm install -g import-js' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'
Plug 'bkad/camelcasemotion'
Plug 'tribela/vim-transparent'
Plug 'tpope/vim-fugitive'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'iamcco/coc-tailwindcss',  {'do': 'npm install --frozen-lockfile && npm run build'}
"Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
call plug#end()

" Coc
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()"

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Coc explorer
nmap <space>e <Cmd>CocCommand explorer<CR>
let g:coc_explorer_global_presets = {
\   'main': {
\     'width': 30
\   },
\ }

" Use preset argument to open it
nmap <space>e <Cmd>CocCommand explorer --no-toggle --preset main<CR>
nmap <space>c <Cmd>CocCommand explorer --preset main<CR>


set encoding=UTF-8
set backspace=indent,eol,start
set autoindent
set history=50
set ruler
set showcmd
set incsearch
set list
set listchars=tab:>·,trail:·
set whichwrap=b,s
set fileencodings=utf8,cp1251
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set expandtab
set laststatus=2
set number
set ignorecase
set smartcase
set relativenumber
set so=7
set cursorline
"set foldenable
"set foldmethod=syntax
set t_Co=256
set backup
set mouse=a
let mapleader=","
let &t_TI = ""
let &t_TE = ""
filetype plugin indent on
filetype indent on
"autocmd FileType text setlocal textwidth=78

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Airline
"let g:airline#extensions#tabline#enabled = 1

" Files
"au BufReadPost *.html set filetype=php

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"" NERDTree
"" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"" Close the tab if NERDTree is the only window remaining in it.
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
"" Start NERDTree. If a file is specified, move the cursor to its window.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Easy motion
map <leader> <Plug>(easymotion-prefix)
"map  <leader>i <Plug>(easymotion-bd-f)
"nmap <leader>i <Plug>(easymotion-overwin-f)
"s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
" nmap <leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <leader>w <Plug>(easymotion-bd-w)
"nmap <leader>w <Plug>(easymotion-overwin-w)

" Emmet
let g:user_emmet_leader_key='<leader>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
    \'javascript.jsx' : {
    \'extends' : 'jsx',
    \},
    \"emmet.includeLanguages": {
    \"javascript": "javascriptreact",
    \ }
    \}
"let g:user_zen_leader_key = '<c-e>'
"autocmd FileType html,xhtml,tt2,tt2html,css,javascript,javascriptreact,typescriptreact imap <buffer> <leader>e <c-y>, | imap <buffer> <C-N> <c-e>n


" Ulti Snippets
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview

" Auto Pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

" NERDCommenter
let g:NERDCompactSexyComs = 1
let g:NERDToggleCheckAllLines = 1

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Allow vim recognize Alt key
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Key Maps
nnoremap <CR> o<ESC>
nnoremap <A-CR> O<ESC>
map <leader>y "+y
map <leader>; A;<ESC>
"map <leader>t :term<CR><c-w>J<c-w>k15<c-w>+<c-w>j
map <leader>t <Plug>(coc-terminal-toggle)
map <c-j> "ydd"yp
map <c-k> "yddk"yP
map <leader>br :Bracey<cr>
map <leader>bs :BraceyStop<cr>
map ,p :set filetype=php<CR>
map <leader>j :ImportJSWord<CR>


"colorscheme
"colorscheme codedark
colorscheme evening
"hi! NonText ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
"hi! Normal ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
"autocmd vimenter * hi NonText guibg=NONE ctermbg=NONE


" Change Color when entering Insert Mode
autocmd InsertEnter * set nocursorline

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * set nocursorline

" Airline
"let g:airline_theme='dark'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#enabled = 1

" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0

" Code beatifiers
"autocmd FileType *,php,jsx,javascriptreact nnoremap <buffer> <leader>f <ESC>mfgg=G'f
"autocmd FileType javascript nnoremap <buffer>  <leader>f :call JsBeautify()<cr>
"autocmd FileType json nnoremap <buffer> <leader>f :call JsonBeautify()<cr>
"autocmd FileType jsx,javascriptreact nnoremap <buffer> <leader>f :call JsxBeautify()<cr>
"autocmd FileType html nnoremap <buffer> <leader>f :call HtmlBeautify()<cr>
"autocmd FileType xhtml nnoremap <buffer> <leader>f :call HtmlBeautify()<cr>
"autocmd FileType css nnoremap <buffer> <leader>f :call CSSBeautify()<cr>
autocmd FileType css,html,javascript,jsx,javascriptreact,tsx,typescriptreact nnoremap <buffer> <leader>f :call Prettier<cr>
