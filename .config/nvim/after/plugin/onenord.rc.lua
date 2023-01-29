local status, n = pcall(require, "onenord")
-- if not status then
if status then
  return
end

-- local color_status, colors = pcall(require, "onenord.colors")
-- local config_status, config = pcall(require, "onenord.config")
-- local styles = config.styles
local colors = require("onenord.colors").load()
local config = require("onenord.config").options

n.setup({
  theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = "NONE",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
  },
  disable = {
    background = true, -- Disable setting the background color
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  -- Inverse highlight for different groups
  inverse = {
    match_paren = false,
  },
  custom_highlights = {
    -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNr = { fg = "#6c6c6c" },
    -- -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    ["@attribute"] = { fg = colors.red },
    -- -- Boolean literals: `True` and `False` in Python.
    -- TSBoolean = { fg = colors.orange },
    -- -- Character literals: `'a'` in C.
    -- TSCharacter = { fg = colors.green },
    -- -- Line comments and block comments.
    ["@comment"] = { fg = "#6c6c6c" },
    -- -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    ["@conditional"] = { fg = colors.yellow, style = config.styles.keywords },
    -- -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    ["@constant"] = { fg = colors.yellow },
    -- -- Built-in constant values: `nil` in Lua.
    -- TSConstBuiltin = { fg = colors.orange },
    -- -- Constants defined by macros: `NULL` in C.
    -- TSConstMacro = { fg = colors.red },
    -- -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    ["@constructor"] = { fg = "#87d7ff" },
    -- -- Syntax/parser errors. This might highlight large sections of code while the user is typing
    -- -- still incomplete code, use a sensible highlight.
    ["@error"] = { fg = colors.fg_light },
    -- -- Exception related keywords: `try`, `except`, `finally` in Python.
    ["@exception"] = { fg = colors.dark_red },
    -- -- Object and struct fields.
    ["@field"] = { fg = colors.pink },
    -- -- Floating-point number literals.
    -- TSFloat = { fg = colors.orange },
    -- -- Function calls and definitions.
    ["@function"] = { fg = "#87d7ff", style = config.styles.functions },
    -- -- Built-in functions: `print` in Lua.
    -- TSFuncBuiltin = { fg = colors.cyan, style = config.styles.functions },
    -- -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    ["@function.macro"] = { fg = colors.dark_red },
    -- -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    ["@include"] = { fg = colors.dark_red },
    -- -- Keywords that don't fit into other categories.
    ["@keyword"] = { fg = colors.dark_blue, style = config.styles.keywords },
    -- -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    -- TSKeywordFunction = { fg = colors.purple, style = config.styles.keywords },
    -- -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    -- TSKeywordOperator = { fg = colors.purple },
    -- -- Keywords like `return` and `yield`.
    ["@keyword.return"] = { fg = "#ffaf5f" },
    -- -- GOTO labels: `label:` in C, and `::label::` in Lua.
    -- TSLabel = { fg = colors.purple },
    -- -- Method calls and definitions.
    ["@method"] = { fg = "#87d7ff" },
    -- -- Identifiers referring to modules and namespaces.
    ["@namespace"] = { fg = "#afd787" },
    -- -- Numeric literals that don't fit into other categories.
    ["@number"] = { fg = "#afd787" },
    -- -- Binary or unary operators: `+`, and also `->` and `*` in C.
    ["@operator"] = { fg = colors.fg_light },
    -- -- Parameters of a function.
    ["@parameter"] = { fg = colors.fg_light },
    -- -- References to parameters of a function.
    -- TSParameterReference = { fg = colors.red },
    -- -- Same as `TSField`.
    ["@property"] = { fg = colors.fg },
    -- -- Punctuation delimiters: Periods, commas, semicolons, etc.
    -- TSPunctDelimiter = { fg = colors.dark_blue },
    -- -- Brackets, braces, parentheses, etc.
    -- TSPunctBracket = { fg = colors.dark_blue },
    -- -- Special punctuation that doesn't fit into the previous categories.
    -- TSPunctSpecial = { fg = colors.dark_blue },
    -- -- Keywords related to loops: `for`, `while`, etc.
    ["@repeat"] = { fg = colors.yellow, style = config.styles.keywords },
    -- -- String literals.
    ["@string"] = { fg = "#5faf5f", style = config.styles.strings },
    -- -- Regular expression literals.
    -- TSStringRegex = { fg = colors.orange },
    -- -- Escape characters within a string: `\n`, `\t`, etc.
    -- TSStringEscape = { fg = colors.orange },
    -- -- Identifiers referring to symbols or atoms.
    -- TSSymbol = { fg = colors.cyan },
    -- -- Tags like HTML tag names.
    -- TSTag = { fg = colors.yellow },
    -- -- HTML tag attributes.
    -- TSTagAttribute = { fg = colors.blue },
    -- -- Tag delimiters like `<` `>` `/`.
    -- TSTagDelimiter = { fg = colors.dark_blue },
    -- -- Non-structured text. Like text in a markup language.
    -- TSText = { fg = colors.fg },
    -- -- Text to be represented in bold.
    -- TSStrong = { fg = colors.purple, style = "bold" },
    -- -- Text to be represented with emphasis.
    -- TSEmphasis = { fg = colors.yellow, style = "italic" },
    -- -- Text to be represented with an underline.
    -- TSUnderline = { style = "underline" },
    -- -- Text that is part of a title.
    -- TSTitle = { fg = colors.blue, style = "bold" },
    -- -- Literal or verbatim text.
    -- TSLiteral = { fg = colors.green },
    -- -- URIs like hyperlinks or email addresses.
    -- TSURI = { fg = colors.cyan, style = "underline" },
    -- -- Math environments like LaTeX's `$ ... $`
    -- TSMath = { fg = colors.fg },
    -- -- Footnotes, text references, citations, etc.
    -- TSTextReference = { fg = colors.purple },
    -- -- Text environments of markup languages.
    -- TSEnvironment = { fg = colors.fg },
    -- -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    -- TSEnvironmentName = { fg = colors.fg },
    -- -- Text representation of an informational note.
    -- TSNote = { fg = colors.info, style = "bold" },
    -- -- Text representation of a warning note.
    -- TSWarning = { fg = colors.warn, style = "bold" },
    -- -- Text representation of a danger note.
    -- TSDanger = { fg = colors.error, style = "bold" },
    -- -- Type (and class) definitions and annotations.
    ["@type"] = { fg = colors.fg },
    -- -- Built-in types: `i32` in Rust.
    ["@type.builtin"] = { fg = "#ffaf5f" },
    -- -- Variable names that don't fit into other categories.
    ["@variable"] = { fg = colors.fg, style = config.styles.variables },
    -- -- Variable names defined by the language: `this` or `self` in Javascript.
    ["@variable.builtin"] = { fg = "#ffaf5f", style = config.styles.variables },
  }, -- Overwrite default highlight groups
  custom_colors = {
    blue = "#5fd7ff",
    orange = "#ffaf5f",
  }, -- Overwrite default colors
})
