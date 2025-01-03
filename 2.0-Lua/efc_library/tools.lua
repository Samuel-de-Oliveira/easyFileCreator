--[[
   Tools for a easy management of functions
--]]

local package = require('package')
local io      = require('io')
local os      = require('os')

local tools = {}


-- Function to get operating system of user
function tools.getSystem()
   local Success, readError = pcall(function()
      local pathSeparator = package.config:sub(1, 1)
   end)
   if Success then
      if pathSeparator == '/' then
         return 'Unix'
      else
         return 'Windows'
      end
   else
      io.write('\027[1;31mAn internal error has happened, Please report this to developer!\027[m')
      os.exit()
   end
end


-- Copy file function
function tools.Copy(Path, FileName)
   -- Read
   local readSuccess, readError = pcall(function()
      local rFile = io.open(Path, 'r')
      strFile = rFile:read('*all')
      rFile:close()
   end)

   -- Write
   if readSuccess then
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


-- Copy folder function
function tools.CopyFolder(Path, folderName)
   if tools.getSystem() == 'Unix' then
      local FolderCreated, readError = pcall(function()
         os.execute('cp -rf ' .. Path ..
                    ' ' .. folderName)
      end)

      if FolderCreated then
        tools.alert()
      else
         tools.alert()
         io.write("\27[1;31mThe software couldn't open " .. FileName .. " beacause of" ..
               readError .. "\27[m\n" ..
               'Please digit \27[44m"efc -?"\27[m for help.\n')
         os.exit()
      end
   else
      io.write('This feature doesn\'t work on Windows yet')
   end
end


-- Verify the existence of files
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


-- Verify the existence of folders
function tools.folderExists(folder)
  local exists, readError = pcall(function()
    os.execute('cd ' .. folder)
    os.execute('cd ..')
  end)

  if exists then
    return true
  else
    return false
  end
end


-- System alert
function tools.alert()
   io.write('\a')
end


return tools
