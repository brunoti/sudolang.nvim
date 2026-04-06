-- Filetype plugin for SudoLang
-- Sets buffer-local options for SudoLang files

-- Comments
vim.bo.commentstring = "// %s"
vim.bo.comments = "://,s1:/*,mb:*,ex:*/"

-- Indentation
vim.bo.autoindent = true
vim.bo.smartindent = true

-- Context-aware indentation
-- Increase indent after opening braces
vim.bo.indentexpr = "GetSudoLangIndent()"

-- Define indentation function
if vim.fn.exists("*GetSudoLangIndent") == 0 then
  vim.cmd([[
    function! GetSudoLangIndent()
      let prevlnum = prevnonblank(v:lnum - 1)
      if prevlnum == 0
        return 0
      endif
      
      let prevline = getline(prevlnum)
      let curline = getline(v:lnum)
      let ind = indent(prevlnum)
      
      " Increase indent after opening brace, function, or interface
      if prevline =~ '{\s*$' || prevline =~ '\v<(function|fn|interface)\s+\w+.*$'
        let ind += shiftwidth()
      endif
      
      " Decrease indent for closing brace
      if curline =~ '^\s*}'
        let ind -= shiftwidth()
      endif
      
      return ind
    endfunction
  ]])
end

-- Folding (disabled by default, can be enabled by user)
-- vim.bo.foldmethod = "syntax"
-- vim.bo.foldlevel = 99
