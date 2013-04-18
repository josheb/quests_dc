#Chaos Proc Spell
#We need tables by level and type, nukes, buffs, mishaps, etc.
#Mishaps shouldn't just end the fight, stuff like bind affinity might be funny.
sub EVENT_SPELL_EFFECT_NPC
{
    my $cl = $entity_list->GetClientByID($caster_id);
    if($cl)
    {
        my $lv = $cl->GetLevel();
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

        my $sptype = quest::ChooseRandom(0,1,2,2,2,3,3,3,3,3);

        if($sptype == 0) { $hchance = 20; $sp = quest::ChooseRandom(@buffs); $cl->Message(15, "The forces of Chaos are benevolent."); }
        if($sptype == 1) { $hchance = 10; $sp = quest::ChooseRandom(@heals); $cl->Message(15, "The forces of Chaos erupt with life."); }
        if($sptype == 2) { $hchance = 70; $sp = quest::ChooseRandom(@debuffs); $cl->Message(15, "The forces of Chaos are malevolent."); }
        if($sptype == 3) { $hchance = 90; $sp = quest::ChooseRandom(@nukes); $cl->Message(15, "The forces of Chaos are hateful."); }

        my $tc = 1;
        if(rand(100) < $hchance) { $tc = 0; }
        if($tc)
        {
            $cl->Message(15, "The forces of Chaos choose you!");
            $cl->CastSpell($sp, $cl->GetID(), 10, 0, 0);
        }
        else
        {
            $cl->Message(15, "The forces of Chaos choose your enemy!");
            $cl->CastSpell($sp, $npc->GetID(), 10, 0, 0);
        }
    }
}

sub EVENT_SPELL_EFFECT_CLIENT
{
   my $cl = $entity_list->GetClientByID($caster_id);
   if($cl)
   {
        my $lv = $cl->GetLevel();
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

        my $sptype = quest::ChooseRandom(0,1,2,2,2,3,3,3,3,3);

        if($sptype == 0) { $hchance = 20; $sp = quest::ChooseRandom(@buffs); $cl->Message(15, "The forces of Chaos are benevolent."); }
        if($sptype == 1) { $hchance = 10; $sp = quest::ChooseRandom(@heals); $cl->Message(15, "The forces of Chaos erupt with life."); }
        if($sptype == 2) { $hchance = 70; $sp = quest::ChooseRandom(@debuffs); $cl->Message(15, "The forces of Chaos are malevolent."); }
        if($sptype == 3) { $hchance = 90; $sp = quest::ChooseRandom(@nukes); $cl->Message(15, "The forces of Chaos are hateful."); }

        my $tc = 1;
        if(rand(100) < $hchance) { $tc = 0; }
        if($tc)
        {
            $cl->Message(15, "The forces of Chaos choose you!");
            $cl->CastSpell($sp, $cl->GetID(), 10, 0, 0);
        }
        else
        {
            $cl->Message(15, "The forces of Chaos choose your enemy!");
            $cl->CastSpell($sp, $client->GetID(), 10, 0, 0);
        }
   }
}
