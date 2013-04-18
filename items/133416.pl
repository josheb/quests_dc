sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $en = $client->GetAggroCount();

    #Use different delays for in and out of combat
    if( $qglobals{'s133416timec'} == 1 && $en > 0)
    {
        return;
    }

    if( $qglobals{'s133416timenc'} == 1 && $en < 1)
    {
        return;
    }

    my $hm = 0;
    if($en > 0)
    {
        my @mobs = $entity_list->GetNPCList();
        $ch = 0;

        foreach $m (@mobs)
        {
            $ha = $m->GetHateAmount($client);
            if($ha > $ch)
            {
                $hm = $m;
            }
        }
    }

    my @buffs = (219, 278, 268, 293, 352, 279, 271, 269, 378, 210);
    my @heals = (17, 200);
    my @debuffs = (230, 216, 242, 302, 645);
    my @nukes = (656, 14, 91, 296, 344, 277);

    if($lv > 10)
    {
        @buffs = (89, 43, 485, 2512, 139, 516, 651, 309, 39, 308, 148,697);
        @heals = (2502, 12);
        @debuffs = (48, 179, 677, 281, 1831, 110);
        @nukes = (413, 1392, 306, 367, 282, 22, 38);
    }

    if($lv > 20)
    {
        @buffs = (2513, 424, 18, 244, 10, 174, 151, 39, 349, 144);
        @heals = (2175, 15);
        @debuffs = (131, 512, 49, 619, 162, 185, 1512);
        @nukes = (414, 78, 450, 451, 204, 434, 470, 465, 461);
    }

    if($lv > 30)
    {
        @buffs = (19, 1445, 312, 2514, 518, 171, 653, 145, 152, 2524);
        @heals = (6875, 13);
        @debuffs = (49, 490, 180, 1513, 507);
        @nukes = (415, 57, 435, 1427, 466, 658, );
    }

    if($lv > 40)
    {
        @buffs = (2505, 4053, 314, 488, 2515, 138, 654, 172, 3696, 394, 157, 337);
        @heals = (6878, 136, 1444);
        @debuffs = (77, 186, 25, 2545, 163);
        @nukes = (416, 672, 1542, 671, 195, 673, 3571, 453, 6, 436, 3573, 732, 755, 733);
    }

    if($lv > 50)
    {
        @buffs = (1774, 2326, 1447, 2188, 1569, 1709, 1711, 1688, 1695, 1599, 1583, 1581, 1579, 1593, 1594);
        @heals = (2182, 1521, 9);
        @debuffs = (133, 1702, 1712, 1716, 1577, 1592);
        @nukes = (1545, 2508, 1607, 1703, 2016, 1619, 1617, 1591, 1590, 2116, 1655, 1641, 1654, 1638, 1639);
    }

    #0 = buff
    #1 = heal
    #2 = debuff
    #3 = nuke

    my $target = $client;

    my $sptype = 0;

    #We're in combat, have a hater
    if($en > 0 && $hm != 0)
    {
        $client->Message(15, "COMBAT!");
        $sptype = quest::ChooseRandom(1,2,2,2,3,3,3);
        my $hchance = $sptype * 30;
        if($sptype == 1) { $hchance = 10; } #keep heal chance low on enemies
        if(rand(100) < $hchance) { $target = $hm; }
        my $waittime = (int(rand(4)) + 1) * 5;
        $client->SetGlobal('s133416timec', 1, 5, "S$waittime");
    }
    else
    {
        $sptype = quest::ChooseRandom(0,0,0,0,0,1,2,3);
        my $waittime = (int(rand(10)) + 1) * 60;
        $client->SetGlobal('s133416timenc', 1, 5, "S$waittime");
    }

    my $sp = 0;

    if($sptype == 0) { $sp = quest::ChooseRandom(@buffs); $client->Message(15, "The $itemname is benevolent."); }
    if($sptype == 1) { $sp = quest::ChooseRandom(@heals); $client->Message(15, "The $itemname erupts with life."); }
    if($sptype == 2) { $sp = quest::ChooseRandom(@debuffs); $client->Message(15, "The $itemname is malevolent."); }
    if($sptype == 3) { $sp = quest::ChooseRandom(@nukes); $client->Message(15, "The $itemname flickers hatefully."); }

    if($en > 0)
    {
        if($target->GetID() == $client->GetID())
        {
            $client->Message(15, "The $itemname has chosen you!");
        }
        else
        {
            $client->Message(15, "The $itemname has chosen your enemy!");
        }
    }
    #$client->Message(15, "CASTING - $sp - $sptype - $en");
    #$target->CastSpell($sp, $target->GetID(), 10, 0, 0);
    $target->SpellFinished($sp, $target, 0, -1000);
}
