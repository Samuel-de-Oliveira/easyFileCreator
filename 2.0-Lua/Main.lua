-- Lua version of EFC Test

-- Requires (To find the main fuctions go to: 'library.lua')
local lib   = require("library")
local tools = require("tools")
local io    = require("io")
local os    = require("os")
local args  = {...}


-- Program structure
if args[1] then
	for i, v in ipairs(args) do
		-- List templates
		if args[i] == '-l' or args[i] == '--list' then
			lib.list()
			os.exit()
		end


      -- Create directory
      if args[i] == '-d' or args[i] == '--directory' then
			io.write('Not finished yet...\n')
		end


		-- Crate file
		if args[i] == '-f' or args[i] == '--file' then
			lib.createFile(
				args[i + 1],
				args[i + 2]
			)
		end


		-- Help message
		if args[i] == '-?' or args[i] == '--help' or args[i] == '-h' then
			lib.help()
			os.exit()
		end


		-- Version
		if args[i] == '-v' or args[i] == '--version' then
			io.write(
			'Version: ' .. lib.VERSION .. '\n' ..
			'Software crated by: Samuel de Oliveira (all rigths reserved)\n' ..
         'You are using a ' .. tools.getSystem() .. ' System.\n' ..
         'Project repository: https://github.com/Samuel-de-Oliveira/easyFileCreator\n'
			)
			os.exit()
		end
	end
else
	-- In case of no arguments
	lib.help()
end
