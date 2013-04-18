sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();

    if( $qglobals{'s133418time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(5)) + 1) * 30;
    $client->SetGlobal('s133418time', 1, 5, "S$waittime");

    my @spells = (6132, 1563);

    if($lv > 20)
    {
        @spells = (6133, 1563);
    }

    if($lv > 40)
    {
        @spells = (6133, 1563, 5317);
    }

    if($lv > 50)
    {
        @spells = (6134, 1563, 5317);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "The $itemname shimmers a soft green.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
