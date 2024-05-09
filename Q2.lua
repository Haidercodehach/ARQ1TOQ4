function printSmallGuildNames(memberCount)
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d", (memberCount,) -- add the here for more  readabilty
    local resultId = db.storeQuery(string.format(selectGuildQuery))
    
    -- Check if the query returned any results if not meneberCount > max members 
    if resultId then
        -- Loop over the results
        for row in resultId do
            local guildName = row["name"]
            print(guildName)
        end
    else
        print("No guilds name found with less than " .. memberCount .. " max members")
    end
end