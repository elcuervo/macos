set number
set ruler

set expandtab
set shiftwidth=2
set tabstop=2

set textwidth=100
set colorcolumn=100
set noswapfile
set mouse=nvirh

inoremap jk <ESC>
nnoremap <Leader><space> :noh<cr>

colorscheme gruvbox

let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_post_private = 1
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'component_function': {
\   'filename': 'LightlineFilename',
\ },
\ 'active': {
\   'right': []
\ }
\ }
