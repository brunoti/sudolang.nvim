# PRD: sudolang.nvim

## Overview

**sudolang.nvim** is a Neovim plugin that provides comprehensive syntax highlighting and editor support for SudoLang, a programming language designed for AI collaboration. The plugin converts the existing VSCode TextMate grammar to Neovim's Lua-based syntax system, providing a zero-config, out-of-the-box experience for the Neovim community.

## Goals

### Primary Goals
1. Provide accurate, performant syntax highlighting for `.sudo`, `.sudo.md`, and `.mdc` files
2. Support markdown integration for mixed-format files
3. Deliver a zero-config experience with sensible defaults
4. Maintain compatibility with modern Neovim versions (0.9.x, 0.10.x, nightly)
5. Create a community-ready plugin with proper documentation and testing

### Secondary Goals
1. Enable context-aware indentation for SudoLang constructs
2. Support both line (`//`) and block (`/* */`) comments
3. Provide a foundation for future enhancements (folding, LSP, etc.)

## Non-Goals

1. Building a Tree-sitter grammar from scratch (future consideration)
2. LSP server implementation
3. Code formatting/linting
4. AI integration features
5. Code folding (v1.0 - planned for future)

## Technical Approach

### Implementation Strategy

**Lua-based Syntax Highlighting**
- Convert TextMate grammar patterns to Neovim Lua syntax using `vim.api`
- Use Lua patterns for matching (not full regex)
- Leverage Neovim's built-in syntax system
- No external dependencies required

### Architecture

```
sudolang.nvim/
├── lua/
│   └── sudolang/
│       ├── init.lua           # Plugin entry point, setup()
│       └── config.lua         # Configuration management
├── syntax/
│   └── sudolang.lua           # Main syntax definitions
├── ftdetect/
│   └── sudolang.lua           # Filetype detection
├── after/
│   └── ftplugin/
│       └── sudolang.lua       # Filetype-specific settings
├── test/
│   ├── fixtures/              # Test SudoLang files
│   └── test_syntax.lua        # Automated syntax tests
├── .github/
│   └── workflows/
│       └── ci.yml             # GitHub Actions CI
├── README.md                  # Essential documentation
├── LICENSE                    # MIT License
└── .luarc.json               # Lua language server config
```

## Features & Requirements

### Core Features (v1.0)

#### 1. Syntax Highlighting
**Priority: P0**

Support all SudoLang language constructs from the TextMate grammar:

- **Keywords**: `ask`, `case`, `constraint`, `function`, `interface`, `if`, `else`, `for each`, `map`, `filter`, etc.
- **Strings**: Double-quoted (`"..."`) and template strings (`` `...` ``)
- **Variables**: `$variableName` syntax
- **Comments**: Line comments (`//`) and block comments (`/* */`)
- **Functions**: `function name()` and `fn name()` syntax
- **Interfaces**: `InterfaceName { ... }` blocks
- **Commands**: `/commandName` syntax
- **Operators**: `+`, `-`, `*`, `/`, `|>`, `==`, `!=`, `&&`, `||`, etc.
- **Literals**: Numbers, booleans (`true`, `false`), `null`
- **Markdown headers**: `#`, `##`, `###`, etc. (for `.sudo.md` files)

#### 2. Filetype Detection
**Priority: P0**

Automatically detect and set filetype for:
- `.sudo` files
- `.sudo.md` files
- `.mdc` files

#### 3. Markdown Integration
**Priority: P0**

- Support mixed markdown + SudoLang syntax in `.sudo.md` and `.mdc` files
- Configurable via `markdown_integration` option (default: `true`)
- Highlight markdown headers, emphasis, links alongside SudoLang syntax

#### 4. Comment Support
**Priority: P0**

- Configure `commentstring` for both line and block comments
- Support Neovim's comment operators (`gcc`, `gc`)
- Default to line comments (`//`) for `gcc`

#### 5. Context-Aware Indentation
**Priority: P1**

- Auto-indent after opening braces `{`
- Auto-indent inside function definitions
- Auto-indent inside interface blocks
- Respect user's `shiftwidth` and `tabstop` settings

#### 6. Zero-Config Setup
**Priority: P0**

- Plugin works immediately after installation
- No required configuration
- Optional `setup()` function for customization:
  ```lua
  require('sudolang').setup({
    markdown_integration = true,  -- default
  })
  ```

### Testing & Quality Assurance

#### Automated Testing
**Priority: P0**

- Test suite using `plenary.nvim` or similar
- Fixture files covering all syntax patterns
- Verify highlight groups are applied correctly
- Test filetype detection for all extensions
- Test indentation behavior

#### CI/CD Pipeline
**Priority: P0**

GitHub Actions workflow:
- Run tests on push/PR
- Test on multiple Neovim versions (0.9.x, 0.10.x, nightly)
- Test on multiple platforms (Linux, macOS, Windows)
- Lint Lua code with `stylua` and `luacheck`
- Generate test coverage reports

### Documentation

#### README.md
**Priority: P0**

Essential documentation including:
1. **Introduction**: What is sudolang.nvim?
2. **Features**: List of supported features
3. **Installation**: 
   - lazy.nvim example (primary)
   - Manual installation
4. **Usage**: Basic usage examples
5. **Configuration**: Optional setup() parameters
6. **Screenshots**: Example of syntax highlighting
7. **Contributing**: How to contribute
8. **License**: MIT

#### Code Documentation
**Priority: P1**

- Inline comments for complex logic
- Function documentation with parameters and return values
- Module-level documentation

### Plugin Manager Support

#### lazy.nvim (Primary)
**Priority: P0**

Provide installation example:
```lua
{
  'yourusername/sudolang.nvim',
  ft = { 'sudolang' },
  config = function()
    require('sudolang').setup()
  end,
}
```

#### Compatibility
**Priority: P1**

- Works with packer.nvim, vim-plug, and manual installation
- No hard dependencies on plugin managers

## Technical Specifications

### Highlight Groups

Map SudoLang syntax to standard Neovim highlight groups:

| SudoLang Element | Highlight Group | Example |
|------------------|-----------------|---------|
| Keywords | `@keyword` | `function`, `if`, `constraint` |
| Strings | `@string` | `"hello"`, `` `template` `` |
| Comments | `@comment` | `// comment`, `/* block */` |
| Functions | `@function` | `function myFunc()` |
| Variables | `@variable` | `$myVar` |
| Operators | `@operator` | `+`, `|>`, `==` |
| Numbers | `@number` | `42`, `3.14` |
| Booleans | `@boolean` | `true`, `false` |
| Commands | `@keyword.directive` | `/help`, `/ask` |
| Interfaces | `@type` | `MyInterface` |
| Properties | `@property` | `name:` in objects |

### Configuration Schema

```lua
{
  markdown_integration = true,  -- boolean: enable markdown syntax in .sudo.md files
}
```

### Performance Requirements

- Syntax highlighting should not cause noticeable lag on files up to 10,000 lines
- Plugin load time should be < 10ms
- Memory footprint should be minimal (< 1MB)

## Success Criteria

### Launch Criteria (v1.0)

- [ ] All P0 features implemented and tested
- [ ] Automated tests passing on CI
- [ ] README documentation complete
- [ ] Plugin installable via lazy.nvim
- [ ] No known critical bugs
- [ ] MIT license applied

### Success Metrics

**Adoption**
- 50+ GitHub stars in first 3 months
- 10+ users reporting successful usage

**Quality**
- 90%+ test coverage
- Zero critical bugs reported
- CI passing on all supported Neovim versions

**Community**
- 3+ external contributors
- Listed in awesome-neovim or similar curated lists

## Future Enhancements (Post v1.0)

### v1.1 - Enhanced Features
- Code folding support
- Improved indentation for complex nested structures
- Snippet support via LuaSnip/UltiSnips

### v2.0 - Tree-sitter Migration
- Build proper Tree-sitter grammar
- Enable advanced features (text objects, incremental parsing)
- Maintain Lua syntax as fallback

### v2.1 - LSP Support
- Basic LSP server for SudoLang
- Diagnostics and linting
- Go-to-definition for functions/interfaces

## Timeline

### Phase 1: Core Implementation (Week 1)
- Set up project structure
- Implement syntax highlighting
- Implement filetype detection
- Basic indentation support

### Phase 2: Testing & CI (Week 1-2)
- Write automated tests
- Set up GitHub Actions
- Test on multiple platforms

### Phase 3: Documentation & Polish (Week 2)
- Write comprehensive README
- Add code documentation
- Create example files
- Take screenshots

### Phase 4: Release (Week 2)
- Tag v1.0.0
- Create GitHub release
- Announce on Reddit/Discord
- Submit to plugin lists

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Lua pattern limitations vs regex | Medium | Document limitations, plan Tree-sitter for v2.0 |
| Neovim API changes | Low | Test on multiple versions, follow deprecation notices |
| Low adoption | Medium | Promote in SudoLang community, improve docs |
| Maintenance burden | Medium | Keep scope focused, automate testing, clear contribution guidelines |

## Open Questions

1. Should we support Neovim < 0.9.x? (Recommendation: No, focus on modern versions)
2. Should we provide default keymaps? (Recommendation: No, let users configure)
3. Should we integrate with nvim-cmp for completions? (Recommendation: Future enhancement)

## Appendix

### Reference Materials
- [SudoLang VSCode Extension](https://github.com/paralleldrive/sudolang)
- [SudoLang TextMate Grammar](https://github.com/paralleldrive/sudolang/blob/main/syntaxes/sudolang.tmLanguage.json)
- [Neovim Syntax Documentation](https://neovim.io/doc/user/syntax.html)
- [Neovim Lua Guide](https://neovim.io/doc/user/lua-guide.html)

### Glossary
- **TextMate Grammar**: JSON-based syntax definition format used by VSCode
- **Lua Patterns**: Simplified pattern matching (not full regex) used by Lua
- **Highlight Groups**: Named groups that define how syntax elements are colored
- **Filetype Plugin**: Neovim plugin that activates for specific file types
