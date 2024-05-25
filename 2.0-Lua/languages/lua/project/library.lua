local io = require('io')

local library = {
	message = 'Hello, world!\n',
   version = '1.0'
}

function library.showHello()
	io.write(library.message)
end

return library
