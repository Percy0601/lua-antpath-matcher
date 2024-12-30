# lua-antpath-matcher
lua-antpath-matcher

```

local AntPathMatcher = require("src.AntPathMatcher")
ant_path_matcher = AntPathMatcher.new()

local pattern = "/bla/**/bla"
local url = "/bla/testing/testing/bla"
local compare = ant_path_matcher:match(pattern, url)
local expect = true
print("pattern: " .. pattern ..", url: " .. url ..", compare: " .. tostring(compare) .. ", expect: " .. tostring(expect) .. " | approved: " .. tostring(expect == compare))

```

