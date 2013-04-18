sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $en = $client->GetAggroCount();

    #Only proc in combat
    if($en < 1) { return; }

    my @spells = (210, 21);

    if($lv > 10)
    {
        push(@spells, 43);
    }

    if($lv > 20)
    {
        push(@spells, 44);
        push(@spells, 648);
    }

    if($lv > 30)
    {
        push(@spells, 170);
        push(@spells, 1534);
    }

    if($lv > 40)
    {
        push(@spells, 176);
        push(@spells, 171);
        push(@spells, 2326);
    }

    if($lv > 50)
    {
        push(@spells, 3186);
        push(@spells, 172);
        push(@spells, 1708);
        push(@spells, 3240);
        push(@spells, 5273);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "Your $itemname emits a radiant glow.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
