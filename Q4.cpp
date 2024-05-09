void Game::addItemToPlayer(const std::string &recipient, uint16_t itemId)
{
    Player *player = g_game.getPlayerByName(recipient);
    if (!player)
    {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient))
        {
            delete player; // Clean up the player object
            return;
        }
    }

    Item *item = Item::CreateItem(itemId);
    if (!item)
    {
        delete player; // Clean up the player object
        delete item;   // Clean up the item object
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline())
    {
        IOLoginData::savePlayer(player);
    }

    delete player; // Clean up the player object
}