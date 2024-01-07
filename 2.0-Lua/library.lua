-- Requires
local io = require("io")
local os = require("os")

-- Constants and variables
local library = {
	version = "2.0"
}

---- Functions ----

-- Help message
function library.help()
	io.write(
	'Usage: \"efc [command] [arguments]\"\n' ..
	'-l: Show the list of templates and exit.\n' ..
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

return library
