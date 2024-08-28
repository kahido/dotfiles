local status, maya_ko = pcall(require, "maya-ko")
if not status then
  return
end

maya_ko.setup({
  transparent = false
})
