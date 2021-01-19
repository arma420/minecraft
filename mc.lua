local monitor = peripheral.find("monitor")
local speaker = peripheral.find("speaker")
monitor.clear()
speaker.playSound("minecraft:block.note_block.harp")
local amount = 10
local balance = 0
monitor.write("Kraunasi...")
monitor.setBackgroundColour(5)
local inMain = true
monitor.clear()
monitor.setBackgroundColour(8)
monitor.setCursorPos(15,7)
monitor.blit("PRADETI","1111111","2222222")
while inMain do
local event, button, x, y = os.pullEvent("monitor_touch")
if  x == 7 and y == 15 then
inMain = false
end
end

monitor.clear()
local inMainGame = true
monitor.setCursorPos(15,7)
monitor.blit("Statymas:" ..amount.."€")
monitor.setCursorPos(13,7)
monitor.blit("+","1","2")
monitor.setCursorPos(17,7)
monitor.blit("-","1","2")
monitor.setCursorPos(15,10)
monitor.blit("ZAISTI","111111","222222")
while inMainGame do
local event, button, x, y = os.pullEvent("monitor_touch")
if   x == 7 and y == 13 then
amount = amout + 1
monitor.setCursorPos(15,7)
monitor.clearLine()
monitor.blit("Statymas:" ..amount.."€")
end
if  x == 17 and y == 7 then
amount = amount - 1
monitor.setCursorPos(15,7)
monitor.clearLine()
monitor.blit("Statymas:" ..amount.."€")
end
if x == 15 and y == 10 then
inMainGame = false
GameWindow()
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
