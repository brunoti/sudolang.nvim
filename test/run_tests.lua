-- Simple test runner for sudolang.nvim
-- Run with: nvim --headless -u NONE -c "lua dofile('test/run_tests.lua')"

-- Set up minimal runtimepath
vim.opt.runtimepath:append(".")

-- Manually load filetype detection
dofile("ftdetect/sudolang.lua")

-- Load the plugin
dofile("lua/sudolang/init.lua")

local tests_passed = 0
local tests_failed = 0

local function test_filetype_detection()
  print("Testing filetype detection...")

  -- Test .sudo files
  local ok, err = pcall(function()
    vim.cmd("edit test/fixtures/syntax_test.sudo")
    local ft = vim.bo.filetype
    if ft ~= "sudolang" then
      error("Expected sudolang, got: " .. ft)
    end
    print("  ✓ .sudo file detected as sudolang")
    vim.cmd("bwipeout!")
    tests_passed = tests_passed + 1
  end)

  if not ok then
    print("  ✗ .sudo file test failed: " .. tostring(err))
    tests_failed = tests_failed + 1
  end

  -- Test .sudo.md files
  ok, err = pcall(function()
    vim.cmd("edit test/fixtures/markdown_test.sudo.md")
    local ft = vim.bo.filetype
    if ft ~= "sudolang" then
      error("Expected sudolang, got: " .. ft)
    end
    print("  ✓ .sudo.md file detected as sudolang")
    vim.cmd("bwipeout!")
    tests_passed = tests_passed + 1
  end)

  if not ok then
    print("  ✗ .sudo.md file test failed: " .. tostring(err))
    tests_failed = tests_failed + 1
  end
end

local function test_plugin_loaded()
  print("\nTesting plugin config...")

  local ok, err = pcall(function()
    local M = dofile("lua/sudolang/init.lua")
    if M.config.markdown_integration ~= true then
      error("Expected markdown_integration to be true")
    end
    print("  ✓ Plugin config loaded correctly")
    tests_passed = tests_passed + 1
  end)

  if not ok then
    print("  ✗ Plugin config test failed: " .. tostring(err))
    tests_failed = tests_failed + 1
  end
end

-- Run tests
local function run_tests()
  print("Running sudolang.nvim tests...\n")
  test_filetype_detection()
  test_plugin_loaded()

  print(string.format("\nResults: %d passed, %d failed", tests_passed, tests_failed))

  if tests_failed == 0 then
    print("✓ All tests passed!")
    os.exit(0)
  else
    print("✗ Some tests failed")
    os.exit(1)
  end
end

run_tests()