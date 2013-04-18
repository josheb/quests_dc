sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();

    if( $qglobals{'s133432time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(10)) + 1) * 480;
    $client->SetGlobal('s133432time', 1, 5, "S$waittime");

    my @spells = (3889, 3892, 6327);

    if($lv > 15)
    {
        @spells = (6328, 3893, 3890);
    }

    if($lv > 30)
    {
        @spells = (3891, 3894, 6329);
    }

    if($lv > 40)
    {
        @spells = (7832, 7833, 7837);
    }

    if($lv > 50)
    {
        @spells = (9612, 9613, 9617);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "A pale light dances within the $itemname.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
