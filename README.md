# santoku-markdown

A C binding that renders Markdown to HTML. It wraps [Sundown](https://github.com/vmg/sundown),
a Markdown parser in C, and exposes a single conversion entry point to Lua. Built on base
[`santoku`](../lua-santoku/README.md) for its test harness.

This README is a usage guide, not an API reference. The tests are the spec: see
`test/spec/santoku/markdown.lua` for the exercised surface.

## Usage

`require("santoku.markdown")` returns a table with one function, `to_html`. It takes a Markdown
string and returns the rendered HTML string.

```lua
local md = require("santoku.markdown")

md.to_html([[
# Title
Some text
## Subtitle
1. Hello
2. World
]])
-- <h1>Title</h1>
--
-- <p>Some text</p>
--
-- <h2>Subtitle</h2>
--
-- <ol>
-- <li>Hello</li>
-- <li>World</li>
-- </ol>
```

The binding calls Sundown with the standard HTML renderer, no extension flags enabled, and a
maximum block nesting depth of 16. Without extensions, the parser follows Sundown's base Markdown
behavior; for example a list immediately under a paragraph with no blank-line separator is treated
as paragraph text, not a list. For the syntax and extension semantics, refer to the
[Sundown documentation](https://github.com/vmg/sundown).

covers: `to_html` round-trip (headings, paragraphs, ordered lists) in
`test/spec/santoku/markdown.lua`.

## License

MIT License

Copyright 2025 Birch Point SWE

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
