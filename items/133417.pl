sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $en = $client->GetAggroCount();

    #Only proc in combat
    if($en < 1) { return; }

    my @spells = (374, 379, 385);
    if($lv > 15)
    {
        push(@spells, 405);
        push(@spells, 461);
    }

    if($lv > 30)
    {
        push(@spells, 471);
        push(@spells, 406);
    }

    if($lv > 45)
    {
        push(@spells, 1542);
        push(@spells, 733);
    }

    if($lv > 50)
    {
        push(@spells, 1653);
        push(@spells, 3473);
        push(@spells, 1654);
        push(@spells, 1655);
        push(@spells, 1657);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "The $itemname emits a flash of light.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
