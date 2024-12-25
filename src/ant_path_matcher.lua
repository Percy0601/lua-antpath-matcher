---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Percy.
--- DateTime: 2024/12/25
---
local ant_path_matcher = {}
--- inner function
--- external use can not care
function ant_path_matcher:new(o)
    local o = o or {}
    setmetatable(o, ant_path_matcher)
    self.__index = ant_path_matcher
    return o
end

--- instance
--- use: ant_path_matcher:instance()
function ant_path_matcher:instance()
    if self.single == nil then
        self.single = self:new()
    end
    return self.single
end

function ant_path_matcher:match(pattern, url)
    if type(pattern) ~= "string" then
        print("pattern must be string!")
        return false
    end

    if #pattern < 1 then
        print("pattern length not empty!")
        return false
    end

    if type(url) ~= "string" then
        print("url must be string")
        return false
    end

    if #url < 1 then
        print("url length not empty!")
        return false
    end

    local m_asterisk_contains = self:contains(pattern, "**")
    local s_asterisk_contains = self:contains(pattern, "*")
    local s_ask_contains = self:contains(pattern, "?")




end

function ant_path_matcher:contains(input, target)
    local pos = string.find(input, target)
    if pos then
        return true
    end
    return false
end

---ends of suffix
---@param input
---@param suffix
---@return boolean of result
function ant_path_matcher:ends(input, suffix)
    return suffix == "" or string.sub(input,-string.len(suffix)) == suffix
end

---starts of prefix
---@param input
---@param prefix
---@return boolean of result
function ant_path_matcher:starts(input, prefix)
    return string.sub(input, 1, string.len(prefix)) == prefix
end

--- split of input
---@param input
---@param delimiter
---@return table of result
function ant_path_matcher:split(input, delimiter)
    local start = 1
    local arr = {}
    while true do
        local pos = string.find(input, delimiter, start, true)
        if not pos then
            break
        end
        table.insert(arr, string.sub(input, start, pos - 1))
        start = pos + string.len(delimiter)
    end
    table.insert(arr, string.sub(input, start))
    return arr
end

return ant_path_matcher
