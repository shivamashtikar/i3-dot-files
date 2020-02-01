
" Call the .nvimrc.plug file
 if filereadable(expand("~/.nvimrc.plug"))
     source ~/.nvimrc.plug
 endif


" Call the .nvimrc file
 if filereadable(expand("~/.nvimrc"))
     source ~/.nvimrc
 endif

