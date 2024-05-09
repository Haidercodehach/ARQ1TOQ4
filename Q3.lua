-- change the name of function for more readabilty
function removePlayerFromParty(playerId, memberName)
    local player = Player(playerId)
    local party = player:getParty()
    -- if the player is in the party then do the below logic
    if party then
        -- Loop over the party members
        for _, member in pairs(party:getMembers()) do
            -- Check if the current member's name matches the target name
            if member:getName() == memberName then
                -- Remove the member from the party
                party:removeMember(member)
                -- Exit the loop as we've found and removed the member
                break
            end
        end
    end
end