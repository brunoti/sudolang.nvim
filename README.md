# sudolang.nvim

Neovim plugin providing syntax highlighting and editor support for [SudoLang](https://github.com/paralleldrive/sudolang), a programming language designed for AI collaboration.

## Features

- 🎨 Comprehensive syntax highlighting for `.sudo`, `.sudo.md`, and `.mdc` files
- 📝 Markdown integration for mixed-format files
- 💬 Support for line (`//`) and block (`/* */`) comments
- 🔧 Context-aware indentation
- ⚡ Zero-config setup with sensible defaults
- 🚀 Lightweight with no external dependencies

## Installation

### lazy.nvim

```lua
{
  'brunoti/sudolang.nvim',
  ft = { 'sudolang' },
  config = function()
    require('sudolang').setup()
  end,
}
```

### packer.nvim

```lua
use {
  'brunoti/sudolang.nvim',
  ft = { 'sudolang' },
  config = function()
    require('sudolang').setup()
  end,
}
```

### Manual Installation

Clone this repository into your Neovim config directory:

```bash
git clone https://github.com/brunoti/sudolang.nvim ~/.config/nvim/pack/plugins/start/sudolang.nvim
```

## Usage

The plugin works automatically for files with `.sudo`, `.sudo.md`, or `.mdc` extensions. No configuration required!

## Configuration

Optional configuration via `setup()`:

```lua
require('sudolang').setup({
  markdown_integration = true,  -- Enable markdown syntax in .sudo.md files (default: true)
})
```

## Syntax Highlighting

sudolang.nvim highlights all SudoLang language constructs:

- **Keywords**: `function`, `interface`, `constraint`, `if`, `else`, `map`, `filter`, etc.
- **Strings**: `"double quoted"` and `` `template strings` ``
- **Variables**: `$variableName`
- **Comments**: `// line comments` and `/* block comments */`
- **Commands**: `/commandName`
- **Operators**: `+`, `-`, `|>`, `==`, `&&`, etc.
- **Functions**: `function myFunc()` or `fn myFunc()`
- **Interfaces**: `MyInterface { ... }`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - see [LICENSE](LICENSE) for details.

## Acknowledgments

- [SudoLang](https://github.com/paralleldrive/sudolang) by Parallel Drive
- Inspired by the VSCode SudoLang extension
