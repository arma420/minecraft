local monitor = peripheral.find("monitor")
local speaker = peripheral.find("speaker")
monitor.clear()
speaker.playSound("minecraft:block.note_block.harp")
local amount = 10
local balance = 100
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
monitor.setCursorPos(19,7)
monitor.write("Statymas:" ..amount.." Eur.")
monitor.setCursorPos(15,7)
monitor.write("Balansas:" ..balance.." Eur.")
monitor.setCursorPos(17,8)
monitor.blit("+","1","2")
monitor.setCursorPos(20,8)
monitor.blit("-","1","2")
monitor.setCursorPos(15,10)
monitor.blit("ZAISTI","111111","222222")
while inMainGame do
local event, button, x, y = os.pullEvent("monitor_touch")
if   x == 17 and y == 8 then
amount = amout + 1
monitor.setCursorPos(15,7)
monitor.clearLine()
monitor.write("Statymas:" ..amount.." Eur.")
end
if  x == 20 and y == 8 then
amount = amount - 1
monitor.setCursorPos(15,7)
monitor.clearLine()
monitor.write("Statymas:" ..amount.." Eur.")
end
if x == 15 and y == 10 then
inMainGame = false
GameWindow()
end
end

monitor.clear()
local dice = getDice()
local player = 0
local ai = 0
for i=1,4 do
if i == 1 then
monitor.setCursorPos(6,6)
math.randomseed(os.time)
local dice =math.floor(math.random(1,6))
player = player + dice
monitor.write(dice)
end
if i == 2 then
monitor.setCursorPos(7,6)
math.randomseed(os.time)
local dice =math.floor(math.random(1,6))
ai = ai + dice
monitor.write(dice)
end
if i == 3 then
monitor.setCursorPos(8,6)
math.randomseed(os.time)
local dice =math.floor(math.random(1,6))
player = player + dice
monitor.write(dice)
end
if i == 4 then
monitor.setCursorPos(9,6)
math.randomseed(os.time)
local dice =math.floor(math.random(1,6))
ai = ai + dice
monitor.write(dice)
end
end
monitor.setCursorPos(1,1)
monitor.write(player)
monitor.setCursorPos(1,2)
monitor.write(ai)
function getDice()
local dice
for i=1,4 do
math.randomseed(os.time)
dice[i] = math.random(1,6)
end
return dice
end
