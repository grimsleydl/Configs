set nocompatible
set bg=dark
"set t_Co=256            " set 256 color
set mouse=a             " make sure mouse is used in all cases.
"if &t_Co == 256
	colorscheme ir_black
"endif
" detect the type of file that is edited.
filetype on
 
" and load the indent file
filetype indent on
 
" enable loading plugin files for specific filetypes
filetype plugin on 

syntax on
set foldmethod=indent
set noea

"source /usr/share/vim/keymap/colemak.vim
cd ~/
"source ~/.vim/scripts/vimsh.vim
"nmap \sh	:source ~/.vim/scripts/vimsh.vim<CR>
"let g:vimsh_sh	= /bin/zsh
"let g:vimsh_prompt_override = 1
"let g:vimsh_prompt_pty      = %m%#
"This is necessary to allow pasting from outside vim. It turns off auto stuff.
"You can tell you are in paste mode when the ruler is not visible
set pastetoggle=<F2>

command! -nargs=? -complete=help Help :vertical help <args>

"Usually annoys me
"set nowrap
" wrap like other editors
set wrap                " word wrap
set textwidth=0         " 
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

"Usually I don't care about case when searching
set ignorecase
"Only ignore case when we type lower case when searching
set smartcase
"Show menu with possible tab completions
"set wildmode=longest,list,full
set wildmenu
"Make the completion menus readable
highlight Pmenu ctermfg=0 ctermbg=3
highlight PmenuSel ctermfg=0 ctermbg=7
set gfn=Terminus\ 10
set foldlevelstart=20
" map : to ; in normal mode
map ; :

map <F8> :NERDTree<cr>

"" always set the status line
"set laststatus=2
" 
"" said status line
"set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \
"\%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
 
let g:EnhCommentifyTraditionalMode = 'no'
let g:EnhCommentifyFirstLineMode = 'no'
let g:EnhCommentifyUserBindings = 'no'
let g:EnhCommentifyUserMode = 'yes'

nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf
nnoremap  <a-right>  gt
nnoremap  <a-left>   gT

" Fast split movement
nmap <C-j> <c-w>j
nmap <C-k> <c-w>k
nmap <C-h> <c-w>h
nmap <C-l> <c-w>l

" Center search results on the screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

"let g:xml_syntax_folding=1
"au FileType xml setlocal foldmethod=syntax
