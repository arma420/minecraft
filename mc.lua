local monitor = peripheral.find("monitor")
local speaker = peripheral.find("speaker")
monitor.clear()
speaker.playSound("minecraft:block.note_block.harp")
local amount = 0
local balance = 0
local event, button, x, y
while true do
event, button, x, y = os.pullEvent("mouse_click")
end
monitor.clear()

local inMain = true
monitor.clear()
monitor.setBackgroundColour("0")
monitor.setCursorPos(10,20)
monitor.blit("PRADETI","1111111","2222222")
while inMain do
if button == 1 and x == 10 and y == 20 then
inMain = false
StartGame()
end
end



function StartGame()
monitor.clear()
local inMain = true
monitor.setCursorPos(10,20)
monitor.blit("Statymas:" + amount ,"1111111111","2222222222")
monitor.setCursorPos(12,18)
monitor.blit("+","1","2")
monitor.setCursorPos(12,22)
monitor.blit("-","1","2")
monitor.setCursorPos(16,20)
monitor.blit("ZAISTI","111111","222222")
while inMain do
if button == 1 and x == 12 and y == 18 then
amount = amout + 1
monitor.setCursorPos(10,20)
monitor.blit("Statymas:" + amount ,"1111111111","2222222222")
end
if button == 1 and x == 12 and y == 22 then
amount = amount - 1
monitor.setCursorPos(10,20)
monitor.blit("Statymas:" + amount ,"1111111111","2222222222")
end
if button == 1 and x == 16 and y == 20 then
GameWindow()
end
end
end
function GameWindow()
local dice = getDice()
for i=1,4 do
if i == 1 then
monitor.setCursorPos(5,10)
monitor.blit(dice[i],"1","2")
end
if i == 2 then
monitor.setCursorPos(6,10)
monitor.blit(dice[i],"1","2")
end
if i == 3 then
monitor.setCursorPos(7,10)
monitor.blit(dice[i],"1","2")
end
if i == 4 then
monitor.setCursorPos(8,10)
monitor.blit(dice[i],"1","2")
end
end
end

function getDice()
local dice
for i=1,4 do
math.randomseed(os.time)
dice[i] = math.random(1,6)
end
return dice
end

