sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $hpp = $client->GetMaxHP() / $client->GetHP();

    if( $qglobals{'s133427time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(3)) + 1) * 30;
    $client->SetGlobal('s133427time', 1, 5, "S$waittime");

    #Near death save
    if($hpp > 7)
    {
        my @ndspells = (3471, 13);
        my $sp = quest::ChooseRandom(@ndspells);
        $client->Message(15, "The $itemname flickers urgently.");
        #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
        $client->SpellFinished($sp, $client, 0, -1000);
        return;
    }

    #HoTs
    if($hpp > 1)
    {
        #Right now just 1 celestial per range, might add more later
        my @hspells = (2502);
        if($lv > 20) { @hspells = (2175); }
        if($lv > 40) { @hspells = (1444); }
        if($lv > 50) { @hspells = (1522); }

        my $sp = quest::ChooseRandom(@hspells);
        $client->Message(15, "The $itemname emits a soothing heat.");
        #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
        $client->SpellFinished($sp, $client, 0, -1000);
        return;
    }

    #If we're full health buffs should have a lesser chance
    my $dobuff = rand(100);
    if($dobuff < 50) { return; }

    #Buffs
    my @bspells = (293, 515);

    if($lv > 10)
    {
        push(@bspells, 516);
        push(@bspells, 650);
    }

    if($lv > 20)
    {
        push(@bspells, 651);
        push(@bspells, 517);
    }

    if($lv > 30)
    {
        push(@bspells, 518);
        push(@bspells, 652);
    }

    if($lv > 40)
    {
        push(@bspells, 653);
        push(@bspells, 519);
    }

    if($lv > 50)
    {
        push(@bspells, 1558);
        push(@bspells, 3450);
        push(@bspells, 5362);
        push(@bspells, 1711);
    }

    my $sp = quest::ChooseRandom(@bspells);

    $client->Message(15, "The $itemname glows softly.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
