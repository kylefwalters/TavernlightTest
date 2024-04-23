-- indent to improve readability

function Party.removeFromParty(self, playerId, membername) -- more descriptive method name, also would work better as a function of Party
    player = Player(playerId)
    if not player then -- early out if no player found
        return
    end
    local party = player:getParty()
    if not party then -- early out if no party found
        return
    end
   
    local membersList = self:getMembers() -- getMembers returns a table, not pairs
for i = 1, #membersList do
        if membersList[i] == Player(membername) then
            party:removeMember(Player(membername))
            break -- can do an early out here, presuming names are unique
        end
    end
end
