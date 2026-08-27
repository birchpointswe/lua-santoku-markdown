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
