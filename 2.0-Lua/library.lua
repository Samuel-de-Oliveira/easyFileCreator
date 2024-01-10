-- Requires
local io = require("io")
local os = require("os")

-- Constants and variables
local library = {
	VERSION = '2.0'
   PATH    = '~/.efc/'
}

---- Functions ----

-- Help message
function library.help()
	io.write(
	'Usage: \"efc [command] [arguments]\"\n' ..
	'-l: Show the list of templates and exit.\n' ..
   '-f: Create a new file [efc -f "FileName" "Language"]\n' ..
   '\n' ..
	'-v: Show version and exit.\n' ..
	'-h: Show this message and exit.\n'
	)
end


function library.list()
	io.write('List of templates:\n')
	for file in io.popen('ls .'):lines() do
		io.write(file .. '  ')
	end
	io.write('\n') -- Break line
end


function library.createFile(fileName, Language)
	-- Error treatment
	if not fileName or not Language then
		io.write('There is missing some arguments...\n' ..
               'Plase digit "efc -?" for help.\n')
		os.exit()
	end

	-- Copy template files
	io.write(fileName .. '\n')
	io.write(Language .. '\n')
end


return library
