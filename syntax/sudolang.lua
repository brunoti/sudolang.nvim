-- SudoLang syntax highlighting for Neovim
-- Converted from TextMate grammar to Neovim Lua syntax

if vim.b.current_syntax then
  return
end

local config = require('sudolang').config-- Clear existing syntax
vim.cmd('syntax clear')

-- Keywords
vim.cmd('syntax keyword sudolangKeyword ask case concat constraint constraints contains continue convert count default defaults describe else emit empty error escape every exists explain filter find first flatMap flatten fn for function groupBy if in includes interface interpolate join list log loop map match max merge min normalize orderBy otherwise pick pluck range replace require requirements reverse revise select skip slice some sort sortBy split take takeLast takeLatest takeUntil takeWhile throw transpile trim unique warn warnings where while wrap zip')

-- Operators
vim.cmd([[syntax match sudolangOperator /[+\-*/%]/]])
vim.cmd([[syntax match sudolangOperator /&&\|||\|!/]])
vim.cmd([[syntax match sudolangOperator /<\|>\|<=\|>=\|==\|!=/]])
vim.cmd([[syntax match sudolangOperator /|>/]])
vim.cmd([[syntax match sudolangOperator /=\|+=\|-=\|*=\|\/=/]])
vim.cmd([[syntax keyword sudolangOperator cap cup xor]])

-- Comments
vim.cmd([[syntax match sudolangComment /\/\/.*$/]])
vim.cmd([[syntax region sudolangComment start="/\*" end="\*\"/"]])

-- Strings
vim.cmd([[syntax region sudolangString start=/"/ end=/"/]])
vim.cmd([[syntax region sudolangString start=/`/ end=/`/]])

-- Variables
vim.cmd([[syntax match sudolangVariable /\$\w\+/]])

-- Numbers
vim.cmd([[syntax match sudolangNumber /\<\d\+\(\.\d\+\)\?\>/]])

-- Booleans and null
vim.cmd([[syntax keyword sudolangBoolean true false]])
vim.cmd([[syntax keyword sudolangNull null]])

-- Commands
vim.cmd([[syntax match sudolangCommand /\/\w\+/]])

-- Interfaces (capitalized words followed by {)
vim.cmd([[syntax match sudolangInterfaceName /\<[A-Z]\w*\ze\s*{/]])

-- Properties
vim.cmd([[syntax match sudolangProperty /\w\+\s*:/]])

-- Markdown headers (if markdown integration is enabled)
if config.markdown_integration then
  vim.cmd([[syntax match sudolangMarkdownH1 /^#\s.*$/]])
  vim.cmd([[syntax match sudolangMarkdownH2 /^##\s.*$/]])
  vim.cmd([[syntax match sudolangMarkdownH3 /^###\s.*$/]])
  vim.cmd([[syntax match sudolangMarkdownH4 /^####\s.*$/]])
  vim.cmd([[syntax match sudolangMarkdownH5 /^#####\s.*$/]])
  vim.cmd([[syntax match sudolangMarkdownH6 /^######\s.*$/]])
end

-- Highlight links
vim.cmd([[highlight default link sudolangKeyword Keyword]])
vim.cmd([[highlight default link sudolangOperator Operator]])
vim.cmd([[highlight default link sudolangComment Comment]])
vim.cmd([[highlight default link sudolangString String]])
vim.cmd([[highlight default link sudolangVariable Identifier]])
vim.cmd([[highlight default link sudolangNumber Number]])
vim.cmd([[highlight default link sudolangBoolean Boolean]])
vim.cmd([[highlight default link sudolangNull Constant]])
vim.cmd([[highlight default link sudolangCommand Keyword]])
vim.cmd([[highlight default link sudolangInterfaceName Type]])
vim.cmd([[highlight default link sudolangProperty Identifier]])
vim.cmd([[highlight default link sudolangMarkdownH1 Title]])
vim.cmd([[highlight default link sudolangMarkdownH2 Title]])
vim.cmd([[highlight default link sudolangMarkdownH3 Title]])
vim.cmd([[highlight default link sudolangMarkdownH4 Title]])
vim.cmd([[highlight default link sudolangMarkdownH5 Title]])
vim.cmd([[highlight default link sudolangMarkdownH6 Title]])

vim.b.current_syntax = "sudolang"