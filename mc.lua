local monitor = peripheral.find("monitor")
local speaker = peripheral.find("speaker")
monitor.clear()
speaker.playSound("minecraft:block.note_block.harp")
local amount = 10
local balance = 100
monitor.write("Kraunasi...")
monitor.setBackgroundColour(5)

function Main() 
local inMain = true
monitor.clear()
monitor.setBackgroundColour(8)
monitor.setCursorPos(15,7)
monitor.blit("PRADETI","1111111","2222222")
while inMain do
local event, button, x, y = os.pullEvent("monitor_touch")
if  x == 7 and y == 15 then
inMain = false
Game()
end
end
end
function Game()
monitor.clear()
local inMainGame = true

monitor.setCursorPos(15,7)
monitor.write("Statymas:" ..amount.." Eur.")
monitor.setCursorPos(15,12)
monitor.write("Balansas:" ..balance-amount.." Eur.")
monitor.setCursorPos(17,8)
monitor.blit("+","1","2")
monitor.setCursorPos(23,8)
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
monitor.setCursorPos(15,12)
monitor.write("Balansas:" ..balance - amount.." Eur.")
end
if  x == 23 and y == 8 then
amount = amount - 1
if amount < 1 then
amount = 1
end
monitor.setCursorPos(15,7)
monitor.clearLine()
monitor.write("Statymas:" ..amount.." Eur.")
monitor.setCursorPos(15,12)
monitor.write("Balansas:" ..balance-amount.." Eur.")
end
if x == 15 and y == 10 then
inMainGame = false
rollDice()
end
end
end 

function rollDice()
monitor.clear()
local player = 0
local ai = 0
monitor.setCursorPos(1,1)
monitor.write(math.floor(player))
monitor.setCursorPos(6,6)
math.randomseed(os.time()-4444)
local dice = math.floor(math.random(1,6))
player = player + dice
monitor.write(dice)
monitor.setCursorPos(20,6)
math.randomseed(os.time()+410)
local dice = math.floor(math.random(1,6))
ai = ai + dice
monitor.write(dice)
monitor.setCursorPos(6,7)
math.randomseed(os.time()-150)
local dice = math.floor(math.random(1,6))
player = player + dice
monitor.write(dice)
monitor.setCursorPos(20,7)
math.randomseed(os.time()+12)
local dice = math.floor(math.random(1,6))
ai = ai + dice
monitor.write(dice)
monitor.setCursorPos(1,1)
monitor.write(math.floor(player))
monitor.setCursorPos(1,2)
monitor.write(ai)
if player > ai then
monitor.clear()
monitor.setCursorPos(15,10)
monitor.write("Laimejai " ..amount*2.." Eur.")
balance = balance + amount
elseif player < ai then
monitor.clear()
monitor.setCursorPos(15,10)
monitor.write("Pralaimejai")
balance = balance + amount * 2
balance = balance - amount
elseif player == ai then
monitor.clear()
monitor.setCursorPos(15,10)
monitor.write("Lygios")
balance = balance + amount * 2
balance = balance
end
monitor.setCursorPos(15,12)
monitor.blit("Testi","11111","aaaaa")
while true do
local event, button, x, y = os.pullEvent("monitor_touch")
if   x == 15 and y == 12 then
Game()
end
end
end

Main()