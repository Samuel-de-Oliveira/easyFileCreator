library = {
   message = 'Hello, world!'
}

function library.hello()
   love.graphics.print(message, 300, 400)
end

return library
