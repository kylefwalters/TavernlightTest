void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    unique_ptr<Player> player = unique_ptr<Player>(g_game.getPlayerByName(recipient)); // can use smart pointers since getPlayerByName returns a copy
    if (!player) {
        player = make_unique<Player>(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            return;
        }
    }

    Item* item = Item::CreateItem(itemId); // don't need to worry about item since it has an internal referenceCounter
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
}
