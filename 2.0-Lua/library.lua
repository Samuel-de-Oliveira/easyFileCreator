-- Requires
local io = require("io")

-- Constants and variables
local library = {
	version = "2.0"
}


-- Functions
function library.help()
	io.write(
	'Usage: \"efc [command] [arguments]\"\n' ..
	'-v: Show version.\n' ..
	'-h: Show this message.\n'
	)
end


return library
