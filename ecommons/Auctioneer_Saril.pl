sub EVENT_SAY
{
    plugin::auctioneer_say($text);
}

sub EVENT_ITEM
{
    plugin::auctioneer_item();
}
