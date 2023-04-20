local io = require("io")

local library = {
	string = "Hello, world!\n"
}

function library.show()
	io.write(library.string)
end

return library
