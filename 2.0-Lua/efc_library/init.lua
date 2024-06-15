--[[
   Library with all the functions of Main.lua
--]]

-- Requires
local io    = require("io")
local os    = require("os")
local json  = require("lunajson")
local tools = require("efc_library/tools")

---- Constants and variables ----
local library = {
   VERSION = '2.0',
}

-- TODO: Finish all Windows paths
if tools.getSystem() == 'Unix' then
   local library = {
      CONFIGPATH = '~/.efc/',
      EFCPATH    = '/usr/lib/efc/',
   }
elseif tools.getSystem() == 'Windows' then
   local library = {
      CONFIGPATH = '.',
      EFCPATH    = '.',
   }
end

---- Functions ----

-- Help message
function library.help()
	io.write(
   '\n' ..
	'\tUsage: \"efc [command] [arguments]\"\n\n' ..
	'\27[32m-l or --list:\27[m Show the list of templates and exit.\n' ..
   '\27[32m-f or --file:\27[m Create a new file [efc -f "FileName" "Language"]\n' ..
   '\27[32m-P or --project:\27[m Create a new project template [efc -P "ProjectName" "Language"]\n' ..
   '\n' ..
	'\27[32m-v or --version:\27[m Show version and exit.\n' ..
	'\27[32m-? or --version:\27[m Show this message and exit.\n' ..
   '\n' ..
   '\tFor any questions about EFC please check the software\'s repository:\n' ..
   '\t\27[1mhttps://github.com/Samuel-de-Oliveira/easyFileCreator\27[m\n' ..
   '\n'
	)
end


-- Show list
function library.list()
	io.write('List of templates:\27[1;34m\n')

   -- Unix like systems
   if tools.getSystem() == "Unix" then
	   for file in io.popen('ls ' .. library.EFCPATH .. 'languages'):lines() do
		   io.write(file .. '  ')
	   end
   elseif tools.getSystem() == "Windows" then
      os.execute('dir')
   end
	io.write('\27[m\n') -- Break line
end


-- Create file template
function library.createFile(fileName, Language)
	-- Error treatment
	if not fileName or not Language then
		io.write('\27[1;31mThere is missing some arguments...\27[m\n' ..
               'Plase digit \27[44m"efc -?"\27[m for help.\n')
		os.exit()
	end

   -- Get config.json variables
   local configFile = io.open(library.EFCPATH .. 'languages/' ..
                              Language .. "/config.json", "r")
   local getConfig  = configFile:read('*all')
   local extension  = json.decode(getConfig).extension
   local mainFile   = json.decode(getConfig).file
   configFile:close()

   -- Verify if the file already exists
   if tools.fileExists(fileName .. extension) then
      io.write("\27[1;31mThe file " .. fileName .. ".lua Alredy exists\27[m\n" ..
               'Please digit \27[44m"efc -?"\27[m for help.\n')
      os.exit()
   end
   
   -- Copy template files
   tools.Copy(
      -- Select language
      library.EFCPATH .. 'languages/' .. Language .. '/' .. mainFile,

      -- Write to filename
      fileName .. extension
   )
end


function library.createProject(projectName, Language)
   -- Error treatment
	if not projectName or not Language then
		io.write('\27[1;31mThere is missing some arguments...\27[m\n' ..
               'Plase digit \27[44m"efc -?"\27[m for help.\n')
		os.exit()
	end

   io.write('Not finished yet\n')
end


return library
