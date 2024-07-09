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
   local readSucess, readError = pcall(function()
      local rFile = io.open(Path, 'r')
      strFile = rFile:read('*all')
      rFile:close()
   end)

   -- Write
   if readSucess then
      local wFile = io.open(FileName, 'w')
      wFile:write(strFile)
      wFile:close()
   else
      tools.alert()
      io.write("\27[1;31mThe software couldn't open " .. FileName .. " beacause of" ..
               readError .. "\27[m\n" ..
               'Please digit \27[44m"efc -?"\27[m for help.\n')
      os.exit()
    end
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
