local monitor = peripheral.find("monitor")
local speaker = peripheral.find("speaker")
local chest = peripheral.wrap("top")
monitor.clear()
speaker.playSound("minecraft:block.note_block.harp")

--local button = monitor.blit("SPAUSK CIA","33333333333","1111111111")

while true do
monitor.clear()
for i = 0, 54 do
local item = chest.getItemDetail(i)
if item ~= nil then 
monitor.print(item)
end
end
end