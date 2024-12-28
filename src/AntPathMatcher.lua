---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Percy.
--- DateTime: 2024/12/30
---

-- AntPathMatcher
local AntPathMatcher = {}
AntPathMatcher.__index = AntPathMatcher

-- 创建一个新的 AntPathMatcher 对象
function AntPathMatcher.new()
    local self = setmetatable({}, AntPathMatcher)
    return self
end

-- 检查路径是否匹配
function AntPathMatcher:match(pattern, path)
    return self:matchInternal(pattern, path, 1, 1)
end

-- 实现匹配逻辑
function AntPathMatcher:matchInternal(pattern, path, patternIndex, pathIndex)
    local pLen = #pattern
    local pathLen = #path

    -- 如果模式已经用完
    if patternIndex > pLen then
        return pathIndex > pathLen
    end

    -- 如果路径已经用完，检查剩余的模式是否匹配
    if pathIndex > pathLen then
        return pattern:sub(patternIndex):gsub("*", "") == ""
    end

    -- 处理匹配的字符
    local patternChar = pattern:sub(patternIndex, patternIndex)
    local pathChar = path:sub(pathIndex, pathIndex)

    if patternChar == "?" then
        return self:matchInternal(pattern, path, patternIndex + 1, pathIndex + 1)
    elseif patternChar == "*" then
        -- '*' 可以匹配任意字符，尝试匹配零个或多个字符
        return self:matchInternal(pattern, path, patternIndex + 1, pathIndex) or
                self:matchInternal(pattern, path, patternIndex, pathIndex + 1)
    elseif patternChar == pathChar then
        return self:matchInternal(pattern, path, patternIndex + 1, pathIndex + 1)
    else
        return false
    end
end


return AntPathMatcher