local lib  = require('library')
local io   = require('io')
local args = {...}

hello = lib:new('Hello, world!')

hello:PrintMessage()
