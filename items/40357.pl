sub EVENT_ITEM_TICK
{
    my $sp = quest::ChooseRandom(243, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 592, 593, 594, 595, 596, 597, 598, 599, 600, 2565, 2826, 3063, 4418, 6107, 8036);
    $client->Message(15, "The Golden Iris glows for a moment.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
