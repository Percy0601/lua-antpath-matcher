---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Percy.
--- DateTime: 2024/12/25
---
local ant_path_matcher = require("src.ant_path_matcher")
print("#############")

matcher = ant_path_matcher:instance();

local result = matcher:contains("hello world", "world")
print("############:" .. tostring(result))

local adb = matcher:starts("gasjkdfg", "gas")

print("1111111111111111: " .. tostring(adb))

--local compare = matcher:match("/bla/**/bla", "/bla/testing/testing/bla")
--print("compare: ".. tostring(compare))

local pattern = "/bla/**/bla"
local url = "/bla/testing/testing/bla"
compare = matcher:match("/bla/**/bla", "/bla/testing/testing/bla")
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))
--- 通配符： ?
pattern = "/jd/a?c"
url = "/jd/abc"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))

pattern = "/jd/a?c"
url = "/jd/ac"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))

pattern = "/jd/a?c"
url = "/jd/axyzc"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))

-----------------------------------------------------
--- 统配符： *

pattern = "/jd/a*c"
url = "/jd/ac"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))


pattern = "/jd/a*c"
url = "/jd/abc"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))


pattern = "/jd/a*c"
url = "/jd//axyzc"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))

pattern = "/jd/a*c"
url = "/jd/a"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))

pattern = "/jd/a*c"
url = "/jd/xc"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))

pattern = "/jd/a*c"
url = "/jd/ac"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))

pattern = "/jd/*/abc"
url = "/jd/d/abc"
compare = matcher:match(pattern, url)
print("pattern: " .. pattern ..", url" .. url ..". compare: ".. tostring(compare))


