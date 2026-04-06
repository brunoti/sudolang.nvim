-- Simple test runner for sudolang.nvim
-- Run with: nvim --headless -u test/run_tests.lua

-- Add plugin to runtimepath
vim.opt.runtimepath:append(".")

-- Load the plugin
require("sudolang").setup()

local function test_filetype_detection()
  print("Testing filetype detection...")
  
  -- Test .sudo files
  vim.cmd("edit test/fixtures/syntax_test.sudo")
  assert(vim.bo.filetype == "sudolang", "Failed: .sudo file should have sudolang filetype")
  print("✓ .sudo filetype detection works")
  
  -- Test .sudo.md files
  vim.cmd("edit test/fixtures/markdown_test.sudo.md")
  assert(vim.bo.filetype == "sudolang", "Failed: .sudo.md file should have sudolang filetype")
  print("✓ .sudo.md filetype detection works")
  
  vim.cmd("bwipeout!")
end

local function test_syntax_loaded()
  print("\nTesting syntax loading...")
  
  vim.cmd("edit test/fixtures/syntax_test.sudo")
  assert(vim.b.current_syntax == "sudolang", "Failed: syntax should be loaded")
  print("✓ Syntax loads correctly")
  
  vim.cmd("bwipeout!")
end

local function test_comment_string()
  print("\nTesting comment configuration...")
  
  vim.cmd("edit test/fixtures/syntax_test.sudo")
  assert(vim.bo.commentstring == "// %s", "Failed: commentstring should be '// %s'")
  print("✓ Comment string configured correctly")
  
  vim.cmd("bwipeout!")
end

-- Run tests
local function run_tests()
  print("Running sudolang.nvim tests...\n")
  
  local success, err = pcall(function()
    test_filetype_detection()
    test_syntax_loaded()
    test_comment_string()
  end)
  
  if success then
    print("\n✓ All tests passed!")
    vim.cmd("quit 0")
  else
    print("\n✗ Tests failed: " .. tostring(err))
    vim.cmd("cquit 1")
  end
end

run_tests()
