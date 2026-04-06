-- SudoLang syntax highlighting
-- Converted from TextMate grammar to Neovim Lua syntax

if vim.b.current_syntax then
  return
end

local config = require('sudolang').config

-- Keywords
vim.cmd([[
  syntax keyword sudolangKeyword ask case concat constraint constraints contains continue convert count
  syntax keyword sudolangKeyword default defaults describe else emit empty error escape every exists
  syntax keyword sudolangKeyword explain filter find first flatMap flatten fn for each function groupBy
  syntax keyword sudolangKeyword if in includes interface interpolate join list log loop map match max
  syntax keyword sudolangKeyword merge min normalize orderBy otherwise pick pluck range replace require
  syntax keyword sudolangKeyword requirements reverse revise select skip slice some sort sortBy split
  syntax keyword sudolangKeyword take takeLast takeLatest takeUntil takeWhile throw transpile trim
  syntax keyword sudolangKeyword unique warn warnings where while wrap zip
]])

-- Operators
vim.cmd([[
  syntax match sudolangOperator "\v\+|-|\*|/|%|\^"
  syntax match sudolangOperator "\v\&\&|\|\||!"
  syntax match sudolangOperator "\v\<|\>|\<\=|\>\=|\=\=|\!\="
  syntax match sudolangOperator "\v\|\>"
  syntax match sudolangOperator "\v\=|\+\=|-\=|\*\=|/\="
  syntax keyword sudolangOperator cap cup xor
]])

-- Comments
vim.cmd([[
  syntax match sudolangComment "//.*$"
  syntax region sudolangComment start="/\*" end="\*/"
]])

-- Strings
vim.cmd([[
  syntax region sudolangString start='"' end='"' skip='\\"' contains=sudolangVariable,sudolangEscape
  syntax region sudolangString start='`' end='`' skip='\\`' contains=sudolangVariable,sudolangEscape
]])

-- Variables
vim.cmd([[
  syntax match sudolangVariable "\$\w\+"
]])

-- Escape sequences
vim.cmd([[
  syntax match sudolangEscape "\\." contained
]])

-- Numbers
vim.cmd([[
  syntax match sudolangNumber "\v<\d+(\.\d+)?>"
]])

-- Booleans
vim.cmd([[
  syntax keyword sudolangBoolean true false
]])

-- Null
vim.cmd([[
  syntax keyword sudolangNull null
]])

-- Functions
vim.cmd([[
  syntax match sudolangFunction "\v<(function|fn)\s+\w+>"
  syntax match sudolangFunctionName "\v<(function|fn)\s+\zs\w+\ze"
]])

-- Commands
vim.cmd([[
  syntax match sudolangCommand "/\w\+"
]])

-- Interfaces
vim.cmd([[
  syntax match sudolangInterface "\v<[A-Z]\w*\s*\{"me=e-1
  syntax match sudolangInterfaceName "\v<[A-Z]\w*\ze\s*\{"
]])

-- Properties (in objects/interfaces)
vim.cmd([[
  syntax match sudolangProperty "\v\w+\s*:"me=e-1
]])

-- Markdown headers (if markdown integration is enabled)
if config.markdown_integration then
  vim.cmd([[
    syntax match sudolangMarkdownH1 "^#\s\+.*$"
    syntax match sudolangMarkdownH2 "^##\s\+.*$"
    syntax match sudolangMarkdownH3 "^###\s\+.*$"
    syntax match sudolangMarkdownH4 "^####\s\+.*$"
    syntax match sudolangMarkdownH5 "^#####\s\+.*$"
    syntax match sudolangMarkdownH6 "^######\s\+.*$"
  ]])
end

-- Highlight links
vim.cmd([[
  highlight default link sudolangKeyword Keyword
  highlight default link sudolangOperator Operator
  highlight default link sudolangComment Comment
  highlight default link sudolangString String
  highlight default link sudolangVariable Identifier
  highlight default link sudolangEscape SpecialChar
  highlight default link sudolangNumber Number
  highlight default link sudolangBoolean Boolean
  highlight default link sudolangNull Constant
  highlight default link sudolangFunction Keyword
  highlight default link sudolangFunctionName Function
  highlight default link sudolangCommand Keyword
  highlight default link sudolangInterface Type
  highlight default link sudolangInterfaceName Type
  highlight default link sudolangProperty Identifier
  highlight default link sudolangMarkdownH1 Title
  highlight default link sudolangMarkdownH2 Title
  highlight default link sudolangMarkdownH3 Title
  highlight default link sudolangMarkdownH4 Title
  highlight default link sudolangMarkdownH5 Title
  highlight default link sudolangMarkdownH6 Title
]])

vim.b.current_syntax = "sudolang"
