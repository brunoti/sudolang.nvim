-- Filetype detection for SudoLang files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.sudo", "*.sudo.md", "*.mdc" },
  callback = function()
    vim.bo.filetype = "sudolang"
  end,
})
