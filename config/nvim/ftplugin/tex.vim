" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0 

" Use Zathura as the VimTeX PDF viewer
let g:vimtex_view_method = 'zathura'

" Configure latexmk
let g:vimtex_compiler_latexmk = {
	\ 'build_dir' : 'build',
	\}

let s:latexmk = 'latexmk -pdf -output-directory=%:p:h/out %'
let &l:makeprg = expand(s:latexmk)
