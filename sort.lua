term.clear()
term.setCursorPos(1,1)
print("Starting to sort...")

function scrollinv ()
  local next = nil
  if turtle.getSelectedSlot() == 16 then
    next = 1
  else
    next = turtle.getSelectedSlot()+1
  end
  turtle.select(next)
end

function drop ()
  turtle.drop(64)
  print("Dropped Item")
end
function remove ()
  turtle.dropDown(64)
  print("Removed item")
end
function keep ()
  turtle.dropUp(64)
end

function check ()
  local above = turtle.inspectUp()
  local below = turtle.inspectDown()
  
  if above == nil then
    print("No chest above the turtle. Waiting...")
    return false
  elseif below == nil then
    print("No chest below the turtle.")
    return true
  else
    return true
  end
end

function checkup ()
  if not check() == true then
    sleep(1)
    checkup()
  end
end

function main ()
  checkup()
  
  local item = turtle.getItemDetail(turtle.getSelectedSlot())

  if item then
    print("Item name: ", item.name)
    print("Item damage value: ", item.damage)
    print("Item count: ", item.count)
    local block = item.name
    if block == "minecraft:cobblestone" then remove()
    elseif block == "chisel:limestone" then remove()
    elseif block == "chisel:diorite" then remove()
    elseif block == "chisel:andesite" then remove()
    elseif block == "chisel:granite" then remove()
    elseif block == "chisel:marble" then remove()
    else keep()
    end
  else
    print("Loading fresh items")
    turtle.suck(64)
    main()
  end
end

while true do
  main()
  scrollinv()
  sleep(0.01)
end

print("Program killed the main loop. Exiting...")
