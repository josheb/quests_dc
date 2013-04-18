sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();

    if( $qglobals{'s133415time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(5)) + 1) * 30;
    $client->SetGlobal('s133415time', 1, 5, "S$waittime");

    my @spells = (62, 63, 203, 213);
    if($lv > 20)
    {
        push(@spells, 226);
        push(@spells, 227);
    }

    if($lv > 40)
    {
        push(@spells, 7513);
        push(@spells, 7509);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "The $itemname glows softly.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
