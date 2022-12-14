local status, cppcs = pcall(require, "cppcs")
if (not status) then return end

cppcs.load()
