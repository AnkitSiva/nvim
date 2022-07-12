let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let NERDTreeIgnore = ['\.pyc$', '\.o', '\.i', '\.class', '\.gch']
let g:startify_bookmarks = [{'a':'~/.vim/vimrc'}, {'s':'~/.zshrc'}]
let g:Tex_ViewRule_pdf = '/Applications/Preview.app'
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['Dockerfile.+'] = 'ue7b0'
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.python = ['python']
let g:vsnip_filetypes.kotlin = ['kotlin']
" let g:pencil#conceallevel = 0 
" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd, md call pencil#init({'wrap': 'hard'})
"                                 \ | call writegood#enable()
"   autocmd FileType text         call pencil#init()
" augroup END
