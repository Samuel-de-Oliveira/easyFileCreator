--[[
   Tools for a easy management of functions
--]]

local package = require('package')

local tools = {}


-- Function to get operating system of user
function tools.getSystem()
   local pathSeparator = package.config:sub(1, 1)

   if pathSeparator == '/' then
      return 'Unix'
   else
      return 'Windows'
   end
end


function tools.Copy(Path, FileName)
   -- Read
   local rFile = io.open(Path, 'r')
   strFile = rFile:read('*all')
   rFile:close()

   -- Write
   local wFile = io.open(FileName, 'w')
   wFile:write(strFile)
   wFile:close()
end


function tools.fileExists(name)
   file = io.open(name, "r")

   -- if the file have something (file is not nil)
   if not file then
      return false
   else
      io.close(file)
      return true
   end
end


function tools.alert()
   io.write('\a')
end

return tools
