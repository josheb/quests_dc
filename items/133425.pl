sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $en = $client->GetAggroCount();

    #Only proc in combat
    if($en < 1) { return; }

    my @spells = (481);

    if($lv > 10)
    {
        push(@spells, 482);
    }

    if($lv > 20)
    {
        push(@spells, 483);
    }

    if($lv > 30)
    {
        push(@spells, 207);
        push(@spells, 484);
    }

    if($lv > 40)
    {
        push(@spells, 8182);
    }

    if($lv > 50)
    {
        push(@spells, 1689);
        push(@spells, 3199);
        push(@spells, 5500);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "The $itemname pulsates with a blue light.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
