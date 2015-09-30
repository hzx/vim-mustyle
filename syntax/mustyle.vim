" Vim syntax file " Language: Mustyle

" Quit when a syntax file was already loaded
if !exists("mustyle_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let mutant_syntax="mustyle"
  " syn region musFold start="{" end="}" transparent fold contains=ALL
endif

" Highlight superfluous closing parens, brackets, braces.
syn match musError "]\|}\|)"

" keyword definitions
syn keyword musInclude    import
syn keyword musPx         px
syn keyword musConstant   none block inline block-inline default pointer repeat no-repeat left top center right bottom absolute relative fixed auto hidden uppercase lowercase capitalize bold normal
syn keyword musNumber     NPOS
syn keyword musStates     hover state
syn keyword musProps      width height top right bottom left cursor color backgroundColor backgroundPosition background padding paddingTop paddingRight paddingBottom paddingLeft margin marginTop marginRight marginBottom marginLeft position float cssFloat border borderTop borderRight borderBottom borderLeft overflow float cssFloat userSelect webkitUserSelect MozUserSelect msUserSelect font fontSize fontFamily fontWeight textTransform

" Comments
syn keyword musTodo       contained TODO FIXME XXX
syn region musComment     start="/\*" end="\*/" contains=musTodo
syn match musLineComment  "//.*" contains=musTodo
syn keyword musColorSymbols   contained 0 1 2 3 4 5 6 7 8 9 a b c d e f A B C D E F
syn region musColorValue  start="#" end=";" contains=musColorSymbols


" Strings
syn region musString      start=+"+ end=+"+ contains=Char

" Blocks
syn region musBlock       start="{" end="}" transparent fold contains=ALL
syn region musParams      start="(" end=")" contains=ALL

" The default highlighting.
command! -nargs=+ HiLink hi def link <args>
HiLink musInclude         Include
HiLink musPx              Constant
HiLink musConstant        Constant
HiLink musNumber          Number
HiLink musStates          Statement
HiLink musProps           Identifier
HiLink musTodo            Todo
HiLink musComment         Comment
HiLink musLineComment     Comment
HiLink musColorValue      Number
HiLink musString          String

HiLink musBlock           Delimiter
" HiLink musParams          Delimiter
