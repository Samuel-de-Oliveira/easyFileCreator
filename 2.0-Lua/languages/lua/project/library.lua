local io = require('io')

local library = {
	string = 'Hello, world!\n'
}

function library.showHello()
	io.write(library.string)
end

return library
