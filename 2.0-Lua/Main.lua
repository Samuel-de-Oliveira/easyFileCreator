-- Lua version of EFC Test

--[[ EasyFileCreator lua version [[--

  This is a Open Source software, this means
  that you are free to copy, distribute, install
  and change this source code by yourself, but you
  need to follow th MIT License Guideless.

  -- Online repository: https://github.com/Samuel-de-Oliveira/easyFileCreator
  -- Created by: Samuel de Oliveira (Github: Samuel-de-Oliveira)
  -- Contribuitors: None

-----------------------------------]]

-- Requires (To find the main fuctions go to: 'library.lua')
local lib   = require("efc_library")
local tools = require("efc_library/tools")
local io    = require("io")
local os    = require("os")
local json  = require("lunajson")
local args  = {...}


-- Program structure
if args[1] then
   
   local findArguments = 0

	for i, v in ipairs(args) do
		-- List templates
		if args[i] == '-l' or args[i] == '--list' then
         findArguments = findArguments + 1
			lib.list()
			os.exit()
		end


      -- Create directory
      if args[i] == '-P' or args[i] == '--project' then
         findArguments = findArguments + 1
         lib.createProject(
            args[i + 1],
            args[i + 2]
         )
		end


		-- Crate file
		if args[i] == '-f' or args[i] == '--file' then
         findArguments = findArguments + 1
			lib.createFile(
				args[i + 1],
				args[i + 2]
			)
		end


		-- Help message
		if args[i] == '-?' or args[i] == '--help' or args[i] == '-h' then
         findArguments = findArguments + 1
			lib.help()
			os.exit()
		end


		-- Version
		if args[i] == '-v' or args[i] == '--version' then
         findArguments = findArguments + 1
			io.write(
			'Version: ' .. lib.VERSION .. '\n' ..
			'Software crated by: Samuel de Oliveira (all rigths reserved)\n' ..
         'You are using a ' .. tools.getSystem() .. ' System.\n' ..
         'Project repository: https://github.com/Samuel-de-Oliveira/easyFileCreator\n'
			)
			os.exit()
		end
	end

   -- In case of a wrong argument
   if findArguments == 0 then
      tools.alert()
      io.write('\n' ..
               '\27[1;31mOh ouch... maybe you digite a wrong argument!\27[m\n' ..
               'Please digit \27[44m"efc -?"\27[m for help.\n' ..
               '\n'
               )
   end

else
	-- In case of no arguments
	lib.help()
end
