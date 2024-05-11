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


function fileExists(name)
   local file = io.open(name, "r")

   -- if the file have something (file is not nil)
   if not file then
      io.close(file)
      return true
   else
      return false
   end
end


return tools
