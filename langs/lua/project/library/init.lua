local io = require('io')

local library = {
   _version = '1.0'
}

function library:new(msg, object)
   local obj = object or {}
   setmetatable(obj, self)
   self.__index = self

   self.Message = msg or nil

   return obj
end

function library:PrintMessage()
   if self.Message then
	   io.write(self.Message .. '\n')
   else
      io.write('Message is nil...')
   end
end

return library
