local test = require("santoku.test")
local serialize = require("santoku.serialize") -- luacheck: ignore
local md = require("santoku.markdown")

test("md", function ()
  assert(md.to_html([[
# Title
Some text
- One
- Two
## Subtitle
1. Hello
2. World
  ]]) == [[
<h1>Title</h1>

<p>Some text
- One
- Two</p>

<h2>Subtitle</h2>

<ol>
<li>Hello</li>
<li>World</li>
</ol>
]])
end)

test("tables", function ()
  assert(md.to_html([[
| A | B |
|---|---|
| 1 | 2 |
]]) == [[
<table><thead>
<tr>
<th>A</th>
<th>B</th>
</tr>
</thead><tbody>
<tr>
<td>1</td>
<td>2</td>
</tr>
</tbody></table>
]])
end)

test("fenced code", function ()
  assert(md.to_html([[
```lua
local x = 1
```
]]) == [[
<pre><code class="lua">local x = 1
</code></pre>
]])
end)
