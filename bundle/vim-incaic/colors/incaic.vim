"---------------------------------------
" Author: Edwin Salgado <edwinfsalgado@gmail.com>
" http://upload.wikimedia.org/wikipedia/commons/9/95/Xterm_color_chart.png
"---------------------------------------

" Initialization {{{
	set background=dark
	hi clear
	if exists('syntax_on')
		syntax reset
	endif
	let g:colors_name = 'incaic'
	if ! has('gui_running')
		if &t_Co != 256
			echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'
			finish
		endif
	endif
" }}}

" Color dictionary parser {{{
	function! s:ColorDictParser(color_dict)
		for [group, group_colors] in items(a:color_dict)
			exec 'hi ' . group
				\ . ' ctermfg=' . (group_colors[0] == '' ? 'NONE' :       group_colors[0])
				\ . ' ctermbg=' . (group_colors[1] == '' ? 'NONE' :       group_colors[1])
				\ . '   cterm=' . (group_colors[2] == '' ? 'NONE' :       group_colors[2])
				\
				\ . '   guifg=' . (group_colors[3] == '' ? 'NONE' : '#' . group_colors[3])
				\ . '   guibg=' . (group_colors[4] == '' ? 'NONE' : '#' . group_colors[4])
				\ . '     gui=' . (group_colors[5] == '' ? 'NONE' :       group_colors[5])
		endfor
	endfunction
" }}}

"	   | Highlight group                |  CTFG |  CTBG |    CTAttributes | || |   GUIFG |    GUIBG |   GUIAttributes |
"	   |--------------------------------|-------|-------|-----------------| || |---------|----------|-----------------| {{{
call s:ColorDictParser({
	\   'Normal'                      : [    231,    233,               '',      'f8f8f2',  '121212',               '']
	\ , 'Visual'                      : [     '',    236,               '',            '',  '303030',               '']
	\
	\ , 'Cursor'                      : [     '',    196,               '',      'ffffff',  'cd0000',               '']
	\ , 'lCursor'                     : [     '',     '',               '',      'ffffff',  '89b6e2',               '']
	\
	\ , 'CursorLine'                  : [     '',    235,               '',            '',  '262626',               '']
	\ , 'CursorLineNr'                : [    231,    240,               '',      'ffffff',  '585858',               '']
	\ , 'CursorColumn'                : [    231,     59,               '',      'ffffff',  '373736',               '']
	\
	\ , 'Folded'                      : [     75,     '',               '',      '5fafff',  '212121',               '']
	\ , 'FoldColumn'                  : [      6,     '',               '',      '00cdcd',        '',               '']
	\ , 'SignColumn'                  : [    231,    233,           'bold',      'ffffff',  '121212',           'bold']
	\ , 'ColorColumn'                 : [      '',   235,               '',            '',  '262626',               '']
	\
	\ , 'StatusLine'                  : [    231,     59,           'bold',      'f8f8f2',  '5f5f5e',           'bold']
	\ , 'StatusLineNC'                : [    231,     59,               '',      'f8f8f2',  '5f5f5e',               '']
	\
	\ , 'LineNr'                      : [    102,    236,               '',      '90908a',  '303030',               '']
	\ , 'VertSplit'                   : [    240,     '',               '',      '585858',  '1c1c1c',               '']
	\
	\ , 'WildMenu'                    : [    234,    231,               '',      '1c1c1c',  'ffffff',               '']
	\ , 'Directory'                   : [    141,     '',               '',      'ae81ff',        '',               '']
	\ , 'Underlined'                  : [     '',     '',      'underline',            '',        '',      'underline']
	\
	\ , 'Question'                    : [     74,     '',           'bold',      '5fafd7',        '',           'bold']
	\ , 'MoreMsg'                     : [    214,     '',           'bold',      'ffaf00',        '',           'bold']
	\ , 'WarningMsg'                  : [    231,    197,           'bold',      'f8f8f0',  'f92672',           'bold']
	\ , 'ErrorMsg'                    : [    231,    197,           'bold',      'f8f8f0',  'f92672',           'bold']
	\
	\ , 'Comment'                     : [    242,     '',               '',      '75715e',        '',         'italic']
	\ , 'vimCommentTitleLeader'       : [    250,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentTitle'             : [    250,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentString'            : [    245,    233,               '',      '8a8a8a',  '121212',               '']
	\
	\ , 'TabLine'                     : [    231,    238,               '',      'ffffff',  '444444',               '']
	\ , 'TabLineSel'                  : [    255,     '',           'bold',      'eeeeee',        '',           'bold']
	\ , 'TabLineFill'                 : [    240,    238,               '',      '585858',  '444444',               '']
	\ , 'TabLineNumber'               : [    160,    238,           'bold',      'd70000',  '444444',           'bold']
	\ , 'TabLineClose'                : [    245,    238,           'bold',      '8a8a8a',  '444444',           'bold']
	\
	\ , 'SpellCap'                    : [    231,     31,           'bold',      'ffffff',  '0087af',           'bold']
	\
	\ , 'SpecialKey'                  : [     59,     59,               '',      '3b3a32',  '373736',               '']
	\ , 'NonText'                     : [     59,    235,               '',      '3b3a32',  '2c2c2b',               '']
	\ , 'MatchParen'                  : [    197,    238,           'bold',      'f92672',  '444444',           'bold']
	\
	\ , 'Constant'                    : [     '',     '',               '',            '',        '',               '']
	\ , 'Special'                     : [    231,     '',               '',      'f8f8f2',        '',               '']
	\ , 'Identifier'                  : [     81,     '',               '',      '66d9ef',        '',         'italic']
	\ , 'Statement'                   : [    197,     '',           'bold',      'f92672',        '',           'bold']
	\ , 'PreProc'                     : [    197,     '',           'bold',      'f92672',        '',           'bold']
	\ , 'Type'                        : [     '',     '',               '',            '',        '',               '']
	\ , 'String'                      : [    186,     '',               '',      'e6db74',        '',               '']
	\ , 'Tag'                         : [    197,     '',           'bold',      'f92672',        '',           'bold']
	\ , 'Number'                      : [    141,     '',               '',      'ae81ff',        '',               '']
	\ , 'Operator'                    : [    197,     '',           'bold',      'f92672',        '',           'bold']
	\ , 'Define'                      : [    197,     '',           'bold',      'f92672',        '',           'bold']
	\ , 'Error'                       : [    208,    124,               '',      'ff8700',  'af0000',               '']
	\ , 'Function'                    : [    148,     '',               '',      'a6e22e',        '',               '']
	\ , 'Include'                     : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'PreCondit'                   : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Keyword'                     : [    197,     '',           'bold',      'f92672',        '',           'bold']
	\ , 'Label'                       : [    186,     '',               '',      '36db74',        '',               '']
	\ , 'IncSearch'                   : [    235,    186,               '',      '272822',  'e6db74',               '']
	\ , 'Search'                      : [    235,    186,               '',            '',  'e6db74',               '']
	\ , 'Title'                       : [    231,     '',           'bold',      'f8f8f2',        '',           'bold']
	\ , 'Delimiter'                   : [    246,     '',               '',      '949494',        '',               '']
	\ , 'StorageClass'                : [     81,     '',               '',      '66d9ef',        '',          'italic']
	\
	\ , 'Todo'                        : [     95,     '',   'inverse,bold',      '75715e',        '', 'inverse,bold,italic']
	\
	\ , 'Boolean'                     : [    141,     '',               '',      'ae81ff',        '',               '']
	\ , 'Character'                   : [    141,     '',               '',      'ae81ff',        '',               '']
	\ , 'Conditional'                 : [    197,     '',           'bold',      'f92672',        '',           'bold']
	\
	\ , 'SyntasticWarning'            : [    220,     94,               '',      'ffff87',  '875f00',           'bold']
	\ , 'SyntasticError'              : [    202,     52,               '',      'ffff87',  '875f00',           'bold']
	\
	\ , 'Pmenu'                       : [     '',     '',               '',            '',        '',               '']
	\ , 'PmenuSel'                    : [     '',    238,               '',            '',  '444444',               '']
	\ , 'PmenuSbar'                   : [    253,    248,               '',      'dadada',  'a8a8a8',               '']
	\
	\ , 'phpEOL'                      : [    245,     '',               '',      'dadada',        '',               '']
	\ , 'phpStringDelim'              : [     94,     '',               '',      '875f00',        '',               '']
	\ , 'phpDelimiter'                : [    160,     '',               '',      'd70000',        '',               '']
	\ , 'phpFunctions'                : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
	\ , 'phpBoolean'                  : [    172,     '',           'bold',      'd78700',        '',           'bold']
	\ , 'phpOperator'                 : [    215,     '',               '',      'ffaf5f',        '',               '']
	\ , 'phpMemberSelector'           : [    138,     '',           'bold',      'af8787',        '',           'bold']
	\ , 'phpParent'                   : [    227,     '',               '',      'ffff5f',        '',               '']
	\
	\ , 'PHPClassTag'                 : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPInterfaceTag'             : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPFunctionTag'              : [    222,     '',           'bold',      'ffd787',        '',           'bold']
	\
	\ , 'pythonDocString'             : [    240,    233,               '',      '585858',  '121212',               '']
	\ , 'pythonDocStringTitle'        : [    245,    233,               '',      'dadada',  '121212',               '']
	\ , 'pythonRun'                   : [     65,     '',               '',      '5f875f',        '',               '']
	\ , 'pythonBuiltinObj'            : [     67,     '',           'bold',      '5f87af',        '',           'bold']
	\ , 'pythonSelf'                  : [    250,     '',           'bold',      'bcbcbc',        '',           'bold']
	\ , 'pythonFunction'              : [    179,     '',           'bold',      'd7af5f',        '',           'bold']
	\ , 'pythonClass'                 : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
	\ , 'pythonExClass'               : [    130,     '',               '',      'af5f00',        '',               '']
	\ , 'pythonException'             : [    130,     '',           'bold',      'af5f00',        '',           'bold']
	\ , 'pythonOperator'              : [    186,     '',               '',      'd7d787',        '',               '']
	\ , 'pythonPreCondit'             : [    152,     '',           'bold',      'afd7d7',        '',           'bold']
	\ , 'pythonDottedName'            : [    166,     '',               '',      'd75f00',        '',               '']
	\ , 'pythonDecorator'             : [    124,     '',           'bold',      'af0000',        '',           'bold']
	\
	\ , 'PythonInterfaceTag'          : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonClassTag'              : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'PythonFunctionTag'           : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonVariableTag'           : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PythonMemberTag'             : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'CTagsImport'                 : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsClass'                  : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'CTagsFunction'               : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsGlobalVariable'         : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'CTagsMember'                 : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'xmlTag'                      : [    149,     '',           'bold',      'afd75f',        '',           'bold']
	\ , 'xmlTagName'                  : [    250,     '',               '',      'bcbcbc',        '',               '']
	\ , 'xmlEndTag'                   : [    209,     '',           'bold',      'ff875f',        '',           'bold']
	\
	\ , 'cssImportant'                : [    166,     '',           'bold',      'd75f00',        '',           'bold']
	\
	\ , 'DiffAdd'                     : [    231,     64,           'bold',      'f8f8f2',  '45820b',           'bold']
	\ , 'DiffChange'                  : [    231,     23,               '',      'f8f8f2',  '213654',               '']
	\ , 'DiffDelete'                  : [     88,     '',               '',      '8a0707',        '',               '']
	\ , 'DiffText'                    : [    231,     24,   'reverse,bold',      'f8f8f2',  '204a87',   'reverse,bold']
	\
	\ , 'diffLine'                    : [     68,     '',           'bold',      '5f87d7',        '',           'bold']
	\ , 'diffFile'                    : [    242,     '',               '',      '6c6c6c',        '',               '']
	\ , 'diffNewFile'                 : [    242,     '',               '',      '6c6c6c',        '',               '']
	\
	\ , 'User1'                       : [    192,    236,               '',      'd7ffd7',  '303030',               '']
	\ , 'User2'                       : [     99,    236,               '',      'dd3333',  '303030',               '']
	\ , 'User3'                       : [    172,    236,               '',      'ff66ff',  '303030',               '']
	\ , 'User4'                       : [    192,    236,               '',      'd7ffd7',  '303030',               '']
	\ , 'User5'                       : [     99,    236,               '',      'eeee40',  '303030',               '']
	\
	\ , 'ExtraWhitespace'             : [     '',    236,               '',            '',  '303030',               '']
\ })
" }}}

"-------------------
" Javascript
"-------------------
"hi link javaScriptFunction		Function
"-------------------
" HTML
"-------------------
hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag
"-------------------
" PHP
"-------------------
hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle
"-------------------
" DIFF
"-------------------
hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete
"---------------------------------------
"   ALL
"---------------------------------------
""hi Normal  guibg=black guifg=white
""hi Comment ctermfg=137
""hi LineNr ctermfg=137
""hi Cursor ctermbg=red ctermfg=white
""hi Function ctermfg=cyan
""hi Cursor guibg=Red guifg=White
""hi Folded ctermfg=cyan ctermbg=black
""hi FoldColumn ctermfg=cyan ctermbg=black
"""hi StatusLine         gui=reverse guibg=#ffff00 guifg=#446666
"""hi StatusLineNC       gui=reverse guibg=#000000 guifg=#aaaaaa
"---------------------------------------
" 	VISUAL
"---------------------------------------
" hi VISUAL term=bold guifg=grey guibg=black
""hi VISUAL guifg=grey guibg=black
"---------------------------------------
" Highlight chars that go over the 80-column limit
"---------------------------------------
"hi OverLength ctermbg=red ctermfg=white guibg=red guifg=white
"match OverLength '\%81v.*'
"---------------------------------------
" Highlight redundant whitespaces and tabs.
"---------------------------------------
" hi RedundantSpaces ctermbg=red guibg=red
" match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
"---------------------------------------
" {MODE/MORE}MSG
"---------------------------------------
" hi ModeMsg            term=bold guifg=Red
" hi MoreMsg            term=bold guifg=Red
"""hi ModeMsg            guifg=Red
"""hi MoreMsg            guifg=Red
"---------------------------------------
"   CSS
"---------------------------------------
" "hi cssComment Comment
" hi link cssTagName cssStatement
" hi link cssSelectorOp cssSpecial
" hi link cssSelectorOp2 cssSpecial
" hi link cssFontProp cssStorageClass
" hi link cssColorProp cssStorageClass
" hi link cssTextProp cssStorageClass
" hi link cssBoxProp cssStorageClass
" hi link cssRenderProp cssStorageClass
" hi link cssAuralProp cssStorageClass
" hi link cssRenderProp cssStorageClass
" hi link cssGeneratedContentProp cssStorageClass
" hi link cssPagingProp cssStorageClass
" hi link cssTableProp cssStorageClass
" hi link cssUIProp cssStorageClass
" hi link cssFontAttr cssType
" hi link cssColorAttr cssType
" hi link cssTextAttr cssType
" hi link cssBoxAttr cssType
" hi link cssRenderAttr cssType
" hi link cssAuralAttr cssType
" hi link cssGeneratedContentAttr cssType
" hi link cssPagingAttr cssType
" hi link cssTableAttr cssType
" hi link cssUIAttr cssType
" hi link cssCommonAttr cssType
" hi link cssPseudoClassId cssPreProc
" hi link cssPseudoClassLang cssConstant
" hi link cssValueLength cssNumber
" hi link cssValueInteger cssNumber
" hi link cssValueNumber cssNumber
" hi link cssValueAngle cssNumber
" hi link cssValueTime cssNumber
" hi link cssValueFrequency cssNumber
" hi link cssFunction cssConstant
" hi link cssURL cssString
" hi link cssFunctionName cssFunction
" hi link cssColor cssConstant
" hi link cssIdentifier cssFunction
" hi link cssImportant cssSpecial
" hi link cssBraces cssFunction
" hi link cssBraceError cssError
" hi link cssError cssError
" hi link cssUnicodeEscape cssSpecial
" hi link cssStringQQ cssString
" hi link cssStringQ cssString
" hi link cssMedia cssSpecial
" hi link cssMediaType cssSpecial
" hi link cssMediaComma cssNormal
" hi link cssFontDescriptor cssSpecial
" hi link cssFontDescriptorFunction cssConstant
" hi link cssFontDescriptorProp cssStorageClass
" hi link cssFontDescriptorAttr cssType
" hi link cssUnicodeRange cssConstant
" hi link cssClassName cssFunction

" hi cssStorageClass term=underline cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=#ffa0a0 guibg=NONE
" hi cssStatement	term=underline ctermfg=Magenta guifg=Magenta
" hi cssError     term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
" hi cssNormal    ctermfg=white ctermbg=black guibg=black guifg=white

" hi cssCharacter	term=underline ctermfg=Magenta guifg=White
" hi cssComment	term=bold ctermfg=Cyan guifg=#997990
" hi cssConditional	term=bold ctermfg=Yellow guifg=#ffff99
" hi cssControl	term=underline ctermfg=LightBlue guifg=#ff80ff
" hi cssElseIfError    term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
" hi cssFunction	term=underline cterm=bold ctermfg=Cyan guifg=Red
" hi cssInclude	term=underline ctermfg=LightBlue guifg=#ff80ff
" hi cssLabel		term=bold ctermfg=Yellow guifg=Cyan
" hi cssNotEmptyLine   ctermbg=Red ctermfg=White guibg=Red guifg=White
" hi cssNumber		term=underline ctermfg=Magenta guifg=White
" hi cssOperator	term=bold ctermfg=Yellow guifg=#ff0099
" hi cssRepeat		term=bold ctermfg=Yellow guifg=#ffff99
" hi cssSharpBang	term=underline ctermfg=LightBlue guifg=#ff80ff
" hi cssString		term=underline ctermfg=Magenta guifg=White
" hi cssTodo	      	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
" 
" "hi cssPreProc 	term=underline ctermfg=Magenta guifg=White
" "hi cssConstant	term=underline ctermfg=Magenta guifg=White
" "hi cssIdentifier	term=underline cterm=bold ctermfg=Cyan guifg=#7aef7a
" "hi cssSpecial	term=bold ctermfg=LightRed guifg=Gray
" "hi cssStatement	term=bold ctermfg=Yellow guifg=#ffff99
" "hi cssType		term=underline ctermfg=LightGreen guifg=#60ff60 gui=bold

" hi cssConstant term=underline cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=#ffa0a0 guibg=NONE
" hi cssSpecial	term=bold cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=Gray guibg=NONE
" hi cssIdentifier	term=underline cterm=bold ctermfg=Cyan ctermbg=NONE gui=NONE guifg=#40ffff guibg=NONE
" hi cssStatement	term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=bold guifg=#ffff60 guibg=NONE
" hi cssPreProc	term=underline cterm=NONE ctermfg=LightBlue ctermbg=NONE gui=NONE guifg=#ff80ff guibg=NONE
" hi cssType		term=underline cterm=NONE ctermfg=LightGreen ctermbg=NONE gui=bold guifg=#60ff60 guibg=NONE
" hi cssUnderlined	term=underline cterm=underline ctermfg=LightBlue gui=underline guifg=#80a0ff
" hi cssIgnore	term=NONE cterm=NONE ctermfg=black ctermbg=NONE gui=NONE guifg=bg guibg=NONE
"---------------------------------------
"   JAVASCRIPT
"---------------------------------------
" hi link javaScriptComment		Comment
" "hi javaScriptComment	ctermfg=137
" hi link javaScriptLineComment		Comment
" "hi javaScriptLineComment	ctermfg=137
" hi link javaScriptCommentTodo		Todo
" hi link javaScriptSpecial		Special
" hi link javaScriptStringS		String
" hi link javaScriptStringD		String
" hi link javaScriptCharacter		Character
" hi link javaScriptSpecialCharacter	javaScriptSpecial
" hi link javaScriptNumber		javaScriptValue
" "hi link javaScriptConditional		Conditional
" hi javaScriptConditional ctermfg=Yellow
" "hi link javaScriptRepeat		Repeat
" hi javaScriptRepeat ctermfg=Yellow
" hi link javaScriptBranch		Conditional
" "hi link javaScriptOperator		Operator
" hi javaScriptOperator ctermfg=Yellow
" hi link javaScriptType			Type
" hi link javaScriptStatement		Statement
" hi link javaScriptFunction		Function
" hi link javaScriptBraces		Function
" hi link javaScriptError		Error
" hi link javaScrParenError		javaScriptError
" hi link javaScriptNull			Keyword
" hi link javaScriptBoolean		Boolean
" hi link javaScriptRegexpString		String
" "hi link javaScriptIdentifier		Identifier
" hi javaScriptIdentifier ctermfg=Yellow
" "hi link javaScriptLabel		Label
" hi javaScriptLabel ctermfg=Yellow
" hi link javaScriptException		Exception
" hi link javaScriptMessage		Keyword
" hi link javaScriptGlobal		Keyword
" hi link javaScriptMember		Keyword
" hi link javaScriptDeprecated		Exception 
" hi link javaScriptReserved		Keyword
" hi link javaScriptDebug		Debug
" hi link javaScriptConstant		Label
"---------------------------------------
" 	PHP
"---------------------------------------
" hi link phpConstant	Constant
" hi link phpCoreConstant	Constant
" "hi phpComment	term=bold ctermfg=137 guifg=#997990
" "hi phpComment	ctermfg=137
" hi phpComment	Comment
" hi link phpException	Exception
" hi link phpBoolean	Boolean
" hi link phpStorageClass	StorageClass
" hi link phpSCKeyword	StorageClass
" hi link phpFCKeyword	Define
" hi link phpStructure	Structure
" hi link phpStringSingle	String
" hi link phpStringDouble	String
" hi link phpNumber	Number
" hi link phpFloat	Float
" hi link phpMethods	Function
" hi link phpFunctions	Function
" "hi phpFunctions	ctermbg=red
" hi link phpBaselib	Function
" hi link phpRepeat	Repeat
" hi link phpConditional	Conditional
" "hi phpConditional	ctermfg=Yellow
" "hi phpLabel	ctermbg=red
" hi link phpLabel	Label
" hi link phpStatement	Statement
" "hi phpStatement	ctermfg=Yellow
" hi link phpKeyword	Statement
" hi link phpType	Type
" hi link phpInclude	Include
" hi link phpDefine	Define
" hi link phpSpecialChar	SpecialChar
" hi link phpParent	Delimiter
" hi phpIdentifier ctermfg=cyan
" hi link phpIdentifierConst	Delimiter
" hi link phpParentError	Error
" hi link phpOctalError	Error
" hi link phpTodo	Todo
" hi link phpMemberSelector	Structure
" hi phpVarSelector ctermfg=Yellow
" ""hi phpOperator ctermfg=Yellow
" hi phpRepeat ctermfg=Yellow
"---------------------------------------
"	HELP
"---------------------------------------
" hi helpExampleStart   ctermfg=black guifg=bg
" hi helpIgnore         ctermfg=black guifg=bg
" hi helpHyperTextJump  term=underline cterm=bold ctermfg=Cyan guifg=#40FF40
" hi helpHyperTextEntry	term=underline ctermfg=Magenta guifg=#ffa0a0
" hi helpHeadline       term=bold ctermfg=Yellow guifg=#ff00ff gui=bold
" hi helpHeader         term=underline ctermfg=LightBlue guifg=#ff80ff
" hi helpSectionDelim   term=underline ctermfg=LightBlue guifg=#ff00ff
" hi helpVim            term=underline cterm=bold ctermfg=Cyan guifg=#40ffff
" hi helpExample        term=bold ctermfg=Cyan guifg=#80a0ff
" hi helpOption         term=underline ctermfg=LightGreen guifg=#60ff60 gui=bold
" hi helpNotVi          term=bold ctermfg=LightRed guifg=Orange
" hi helpSpecial        term=bold ctermfg=LightRed guifg=Orange
" hi helpNote 		term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
" hi Subtitle           term=underline cterm=bold ctermfg=Cyan guifg=#40ffff
"---------------------------------------
"	LS
"---------------------------------------
" hi LsDir  start=<Esc>[32m    stop=<Esc>[m ctermfg=green   guifg=#ffff99
" hi LsSln  start=<Esc>[36m    stop=<Esc>[m ctermfg=cyan    guifg=cyan
" hi LsFifo start=<Esc>[31m    stop=<Esc>[m ctermfg=red     guifg=Red
" hi LsSock start=<Esc>[33m    stop=<Esc>[m ctermfg=yellow  guifg=#ffff60
" hi LsExe  start=<Esc>[35m    stop=<Esc>[m ctermfg=magenta guifg=#7aef7a
" hi LsAny  start=<Esc>[35m    stop=<Esc>[m ctermfg=yellow  guifg=white
" hi LsCom  start=<Esc>[35m    stop=<Esc>[m ctermfg=white   guifg=#909090
" hi LsOper start=<Esc>[35m    stop=<Esc>[m ctermfg=yellow  guifg=yellow
" hi LsBody start=<Esc>[35m    stop=<Esc>[m ctermfg=green   guifg=#997990
" hi LsSpl  start=<Esc>[44,37m stop=<Esc>[m ctermfg=white   ctermbg=blue guifg=white guibg=blue
" let did_ls_syntax_inits = 1
"---------------------------------------
" 	TERALOG
"---------------------------------------
" hi teralogInca         term=bold ctermfg=Magenta guifg=black   guibg=#7AEF7A
" hi teralogSentData     term=bold ctermfg=Magenta guifg=#FFFF99
" hi teralogRcvdData     term=bold ctermfg=Magenta guifg=#FFA0A0
" hi teralogComment	 term=bold ctermfg=Cyan    guifg=#997990
" hi teralogTime	 term=bold ctermfg=Magenta guifg=#80A0FF
" hi teralogTasks        term=bold ctermfg=Magenta guifg=#997990
" hi teralogInit         term=bold ctermfg=Magenta guifg=#997990
" hi teralogSimRun       term=bold ctermfg=Magenta guifg=#FF80FF
" hi teralogWarn	 term=bold ctermfg=Magenta guifg=red     guibg=yellow
" hi teralogTimeout	 term=bold ctermfg=Magenta guifg=black   guibg=red
" hi teralogError	 term=bold ctermfg=Magenta guifg=yellow  guibg=red
" let did_teralog_syntax_inits = 1
