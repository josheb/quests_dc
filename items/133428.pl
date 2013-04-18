sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();

    if( $qglobals{'s133428time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(5)) + 1) * 30;
    $client->SetGlobal('s133428time', 1, 5, "S$waittime");

    my @spells = (256, 332);

    if($lv > 10)
    {
        push(@spells, 411);
        push(@spells, 273);
    }

    if($lv > 20)
    {
        push(@spells, 129);
        push(@spells, 479);

    }

    if($lv > 30)
    {
        push(@spells, 680);
        push(@spells, 432);
    }

    if($lv > 40)
    {
        push(@spells, 356);
        push(@spells, 412);
    }

    if($lv > 50)
    {
        push(@spells, 1668);
        push(@spells, 1667);
        push(@spells, 3198);
        push(@spells, 5466);
        push(@spells, 1560);
        push(@spells, 3448);
        push(@spells, 5358);
        push(@spells, 8497);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "The $itemname glows softly.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
