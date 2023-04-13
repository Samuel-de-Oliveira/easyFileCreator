local library = {}
local io = require("io")

library.hello = function()
	io.write("Hello, world!\n")
end

return library
