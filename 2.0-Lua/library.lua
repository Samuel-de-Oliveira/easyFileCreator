-- Requires
local io    = require("io")
local os    = require("os")
local tools = require("tools")

-- Constants and variables
local library = {
	VERSION    = '2.0',
   CONFIGPATH = '~/.efc/',
   LANGSPATH  = '/usr/lib/efc/langs/'
}

---- Functions ----

-- Help message
function library.help()
	io.write(
	'\tUsage: \"efc [command] [arguments]\"\n\n' ..
	'-l or --list: Show the list of templates and exit.\n' ..
   '-f or --file: Create a new file [efc -f "FileName" "Language"]\n' ..
   '\n' ..
	'-v or --version: Show version and exit.\n' ..
	'-? or --version: Show this message and exit.\n'
	)
end


-- Show list
function library.list()
	io.write('List of templates:\n')

   -- Unix like systems
   if tools.getSystem() == "Unix" then
	   for file in io.popen('ls .'):lines() do
		   io.write(file .. '  ')
	   end
   elseif tools.getSystem() == "Windows" then
      os.execute('dir')
   end
	io.write('\n') -- Break line
end


-- Create file template
function library.createFile(fileName, Language)
   

	-- Error treatment
	if not fileName or not Language then
		io.write('There is missing some arguments...\n' ..
               'Plase digit "efc -?" for help.\n')
		os.exit()
	end

	-- Copy template files
	local file = io.open(fileName, 'a')
   io.output(file)
	io.write(Language .. '\n')
   io.close(file)
   
   tools.Copy(
      -- Select language
      library.LANGSPATH .. Language .. '/',

      -- Write to filename
      fileName
   )
end


return library
