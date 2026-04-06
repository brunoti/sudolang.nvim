vim.filetype.add({
  extension = {
    sudo = "sudolang",
  },
  pattern = {
    [".*%.sudo%.md"] = "sudolang",
    [".*%.mdc"] = "sudolang",
  },
})
