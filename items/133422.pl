sub EVENT_ITEM_TICK
{
    my $grp = $client->GetGroup();

    if( $qglobals{'s133422time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(5)) + 1) * 30;
    $client->SetGlobal('s133422time', 1, 5, "S$waittime");

    if(!$grp)
    {
        $client->Message(315, "The $itemname longs for company.");
        #$client->CastSpell(48, $client->GetID(), 10, 0, 0);
        $client->SpellFinished(48, $client, 0, -1000);
        return;
    }

    my $gc = 0;
    my $gcl = 0;
    my $lv = 99;
#    $client->Message(315, "Finding lowest group member.");
    for($gc = 0; $gc < 6; $gc++)
    {
        $gcl = $grp->GetMember($gc);
        if($gcl)
        {
            if($gcl->GetLevel() < $lv) { $lv = $gcl->GetLevel(); }
        }
    }
#    $client->Message(315, "Using $lv -");

    if($lv > 90) { return; }

    my @spells = (267, 279, 650, 26, 284, 269, 288);

    if($lv > 10)
    {
        push(@spells, 309);
        push(@spells, 421);
        push(@spells, 293);
    }

    if($lv > 20)
    {
        push(@spells, 278);
        push(@spells, 421);
        push(@spells, 219);
    }

    if($lv > 30)
    {
        push(@spells, 312);
        push(@spells, 4054);
        push(@spells, 326);
        push(@spells, 1408);
    }

    if($lv > 40)
    {
        push(@spells, 2176);
        push(@spells, 308);
        push(@spells, 680);
    }

    if($lv > 50)
    {
        push(@spells, 1667);
        push(@spells, 145);
        push(@spells, 2624);
        push(@spells, 1447);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "The $itemname is bathed in wisps of flame.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $grp->CastGroupSpell($client, $sp);
}
