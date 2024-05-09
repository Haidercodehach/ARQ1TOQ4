local function releaseStorage(player)
    -- Ensur the storage value is set correctly
    local success,errorMessage = pcall(function() return player:setStorageValue(1000, -1) end)
    if not success then
        print("ERROR releasing storage: " ,errorMessage)
        return
    end
end
    
function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player)
        return true
    else 
        print("Condition not met to release storage...")
        return false
    end
end
