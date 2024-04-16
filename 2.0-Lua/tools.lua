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
   strFile = infile:read('*a')
   rFile:close()

   -- Write
   local wFile = io.open(FileName, 'w')
   wfile:write(strFile)
   wFile:close()
end

return tools
