-- Lua version of EFC Test

-- Requires (To find the fuctions go to: 'library.lua')
local lib  = require("library")
local io   = require("io")
local os   = require("os")
local args = {...}


-- Program structure
if args[1] then
	for i,v in ipairs(args) do
		-- Help message
		if args[i] == '-h' then
			lib.help()
			os.exit()
		end

		-- Version
		if args[i] == '-v' then
			io.write('Version: ' .. lib.version .. '\n')
		end
	end
else
	-- In case of no arguments
	lib.help()
end
