<p align="center">
  <img src="https://santoku.dev/logo.png" width="96" height="96" alt="santoku">
</p>

# santoku-markdown

Renders Markdown to HTML. A thin Lua binding over [Sundown](https://github.com/vmg/sundown),
a Markdown parser in C, exposing a single conversion entry point.

## Install

```sh
luarocks install santoku-markdown
```

## Example

```lua
local markdown = require("santoku.markdown")

print(markdown.to_html("# Title\n"))
```

## Documentation

Runnable examples and the full API: [santoku.dev](https://santoku.dev/#santoku-markdown).

## Tests

The tests are the spec. For the exhaustive surface, read them:
[`test/spec/santoku/markdown.lua`](test/spec/santoku/markdown.lua).

## License

MIT, see [LICENSE](LICENSE).

## Anchor spec

Reproduced verbatim from
[`test/spec/santoku/readme_anchor.lua`](test/spec/santoku/readme_anchor.lua), and kept in
sync by [`test/spec/santoku/readme.lua`](test/spec/santoku/readme.lua), which fails the
build if the two ever diverge.

```lua
local test = require("santoku.test")

local err = require("santoku.error")
local assert = err.assert

local validate = require("santoku.validate")
local eq = validate.isequal

local markdown = require("santoku.markdown")

test("render a markdown document to html", function ()
  assert(eq(markdown.to_html([[
# Title
Some text
- One
- Two
## Subtitle
1. Hello
2. World
  ]]), [[
<h1>Title</h1>

<p>Some text
- One
- Two</p>

<h2>Subtitle</h2>

<ol>
<li>Hello</li>
<li>World</li>
</ol>
]]))
end)

test("to_html always returns a string", function ()
  assert(eq(type(markdown.to_html("plain")), "string"))
end)
```
