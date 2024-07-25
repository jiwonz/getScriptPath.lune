--!optimize 2
--!strict

local fs = require("@lune/fs")

return function(): string
	local path = string.match(debug.info(2, "s"), '%[string "([^"]*)"%]')
	local luauPath = path .. ".luau"
	local luaPath = path .. ".lua"
	if fs.isFile(luauPath) then
		return luauPath
	elseif fs.isFile(luaPath) then
		return luaPath
	elseif fs.isFile(path) then
		return path
	else
		error("Failed to get script path")
	end
end
