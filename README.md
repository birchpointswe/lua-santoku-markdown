<p align="center">
  <img src="https://santoku.dev/logo-santoku-markdown.png" height="64" alt="santoku-markdown">
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

For agents and LLM tooling: [llms.txt](https://santoku.dev/llms.txt) for the index,
[llms-full.txt](https://santoku.dev/llms-full.txt) for every documented example.

## Tests

The tests are the spec. For the exhaustive surface, read them:
[`test/spec/santoku/markdown.lua`](test/spec/santoku/markdown.lua).

## License

MIT, see [LICENSE](LICENSE).

## More examples

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
