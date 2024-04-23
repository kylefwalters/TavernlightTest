-- indent to improve readability

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
   
    if resultId ~= false -- check that resultId is valid
        repeat -- iterate through all results
            local guildName = result.getString(resultId, "name") -- missing resultId
            print(guildName)
        until not result.next(resultId)
        result.free(resultId) -- free memory for query result, since it is no longer needed
    end
end
