"   This is the personal .vimrc file of Nickson Kaigi.
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand,
"   as I have done from other notable vim purists
"

set nocompatible                "Use Vim settings, rather than Vi settings
                                "Be IMproved

filetype off                    "required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
Bundle 'sophacles/vim-bundle-mako'
Bundle 'bling/vim-airline'
Bundle 'flazz/vim-colorschemes'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'yearofmoo/Vim-Darkmate'
Bundle 'https://github.com/kien/ctrlp.vim.git'
"Bundle 'http://github.com/sandeepcr529/Buffet.vim'
Bundle 'https://github.com/kana/vim-altr'
Bundle 'https://github.com/airblade/vim-rooter.git'
Bundle 'https://github.com/Raimondi/delimitMate.git'
Bundle 'https://github.com/Yggdroot/indentLine.git'
Bundle 'derekwyatt/vim-scala'
Bundle 'tomasr/molokai'
Bundle 'https://github.com/yueyoum/vim-linemovement'
Bundle 'sickill/vim-monokai'

" Python plugin bundles
if has('python') || has('python3')
  Bundle 'SirVer/ultisnips'
  Bundle 'spiroid/vim-ultisnip-scala'
endif

"Bundle 'Shougo/neosnippet'
"Bundle 'Shougo/neocomplete'
"Bundle 'git://github.com/drmingdrmer/xptemplate-dist.git'


filetype plugin indent on       "required!

set nowrap                      "don't allow wrapped lines

set backspace=indent,eol,start  "allow backspacing over everything in insert mode

set history=50                  "keep 50 lines of command line history

set ruler                       "show the cursor position all the time

set showcmd                     "display incomplete commands

set incsearch                   "do incremental searching

set nu                          "show line numbers

set expandtab                   "use spaces instead of tabs

set tabstop=3                   "insert 4 spaces whenever the tab key is pressed

set shiftwidth=3                "set indentation to 4 spaces

set hlsearch                    "highlight search terms

set ic                          "Ignore Case during searches

set autoindent                  "start new line at the same indentation level

syntax enable                   "syntax highlighting

set cmdheight=1                 "The commandbar height

set showmatch                   "Show matching bracets when text indicator is over them

set nobackup                    " do not keep backup files, it's 70's style cluttering

set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files
                                "    anyway?
                                "    https://github.com/nvie/vimrc/blob/master/vimrc#L141
" VIM powerline setups
set laststatus=2
set noshowmode

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END


set splitbelow                  " Horizontal splits open below current file

set splitright                  " Vertical splits open to the right of the current file

" desert256 is the first choise colorscheme. Don't use background=dark with it!
colorscheme desert256
"colorscheme monokai

" colorscheme wombat256

"colorscheme molokai
"set background=dark
"let g:rehash256 = 1


if has("gui_running")
  if has("gui_gtk2")
"  set guifont=Source\ Code\ Pro\ Medium\ 10
"  set guifont=Monospace\ 10
"  set guifont=Monaco\ 9
    set guifont=Anonymous\ Pro\ 11
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

autocmd FileType c,cpp,h,hpp,scala,txt,ini,json,csv,xml,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Configuration for vim-altr
nmap <F2> <Plug>(altr-forward)
nmap <S-F2> <Plug>(altr-back)

" Starting with Vim 7, there's no need for an additional :Make command; autocmds can be used to hook into the execution 
" of the quickfix command, and open the quickfix window automatically:
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for
" quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens
" it
" (but not if it's already open). However, as part of the autocmd, this
" doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Note that the quickfix window will also automatically close in case the quickfix list becomes empty. 
" If instead you always want to open the quickfix window, replace the cwindow with copen.

" :cc      see the current error
" :cn      next error
" :cp      previous error
" :clist   list all errors

" Config for Deliminate
let delimitMate_expand_cr = 1

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" Buffet plugin
" map <F3> :Bufferlist<CR>

map <F3> :CtrlPBuffer<CR>


" Sorting of imports with :SortScalaImports

set listchars=tab:»·,trail:·
set list

" Reformat paragraphs and list.
nnoremap <Leader>r gq}

" Delete trailing white space and Dos-returns and to expand tabs to spaces.
nnoremap <Leader>t :set et<CR>:retab!<CR>:%s/[\r \t]\+$//<CR>

autocmd BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
        \ textwidth=70 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>



"set t_ku=OA
"set t_kd=OB
"set t_kr=OC
"set t_kl=OD



"" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"
""
"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

