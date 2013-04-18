sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();

    if( $qglobals{'s133423time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(5)) + 1) * 30;
    $client->SetGlobal('s133423time', 1, 5, "S$waittime");

    my @spells = (2561, 697);

    if($lv > 20)
    {
        push(@spells, 2562);
        push(@spells, 174);
        push(@spells, 33);
        push(@spells, 940);
    }

    if($lv > 40)
    {
        push(@spells, 1408);
        push(@spells, 175);
        push(@spells, 1694);
    }

    if($lv > 50)
    {
        push(@spells, 1693);
        push(@spells, 1409);
        push(@spells, 1695);
        push(@spells, 1688);
        push(@spells, 1410);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "The $itemname is briefly surrounded by a blue aura.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
