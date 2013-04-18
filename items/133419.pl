sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();

    if( $qglobals{'s133419time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(5)) + 1) * 30;
    $client->SetGlobal('s133419time', 1, 5, "S$waittime");

    my @spells = (346, 641, 359);

    if($lv > 10)
    {
        push(@spells, 265);
        push(@spells, 364);
    }

    if($lv > 20)
    {
        push(@spells, 642);
        push(@spells, 754);
    }

    if($lv > 30)
    {
        push(@spells, 1572);
        push(@spells, 643);
    }

    if($lv > 40)
    {
        push(@spells, 1332);
        push(@spells, 644);
    }

    if($lv > 50)
    {
        push(@spells, 1611);
        push(@spells, 1416);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "The $itemname emits a dark miasma.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
