-- Lua version of EFC Test

-- Requires (To find the fuctions go to: 'library.lua')
local lib  = require("library")
local io   = require("io")
local os   = require("os")
local args = {...}


-- Program structure
if args[1] then
	for i, v in ipairs(args) do
		-- List
		if args[i] == '-l' or args == '--list' then
			lib.list()
			os.exit()
		end

		-- Crate file
		if args[i] == '-f' or args == '--file' then
			lib.createFile(
				args[i + 1],
				args[i + 2]
			)
		end

		-- Help message
		if args[i] == '-?' or args[i] == '--help' then
			lib.help()
			os.exit()
		end

		-- Version
		if args[i] == '-v' or args[i] == '--version' then
			io.write(
			'Version: ' .. lib.VERSION .. '\n' ..
			'Software crated by: Samuel de Oliveira (all rigths reserved)\n'
			)
			os.exit()
		end
	end
else
	-- In case of no arguments
	lib.help()
end
