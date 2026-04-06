# Contributing to sudolang.nvim

Thank you for your interest in contributing to sudolang.nvim! This document provides guidelines for contributing to the project.

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:
- A clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Your Neovim version (`nvim --version`)
- Your OS

### Suggesting Features

Feature suggestions are welcome! Please open an issue describing:
- The feature you'd like to see
- Why it would be useful
- How it might work

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests and linting:
   ```bash
   luacheck lua/ --globals vim
   stylua --check .
   ```
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to your branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### Code Style

- Follow the existing code style
- Use 2 spaces for indentation
- Run `stylua` to format Lua code
- Add comments for complex logic
- Update documentation as needed

### Testing

- Add tests for new features
- Ensure all tests pass before submitting PR
- Test on multiple Neovim versions if possible

## Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/sudolang.nvim.git
   cd sudolang.nvim
   ```

2. Install development dependencies:
   ```bash
   luarocks install luacheck
   # Install stylua from https://github.com/JohnnyMorganz/StyLua
   ```

3. Test your changes:
   ```bash
   nvim --headless -u NONE \
     -c "set runtimepath+=." \
     -c "source syntax/sudolang.lua" \
     -c "edit test/fixtures/syntax_test.sudo" \
     -c "quit"
   ```

## Questions?

Feel free to open an issue for any questions about contributing!
