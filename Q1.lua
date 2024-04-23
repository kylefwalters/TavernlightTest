-- indent to improve readability

-- asign local var for key so intent is clearer; ideally would move this where it could be accessed by other files if needed
local storageKey = 1000

local function releaseStorage(player)
     player:setStorageValue(storageKey, nil) -- actually release storage
end

function onLogout(player)
     if player:getStorageValue(storageKey) == true then
          addEvent(releaseStorage, storageKey, player)
     end
     return true
end
