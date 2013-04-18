sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $pid = $client->GetPetID();

    if($pid > 0)
    {
        return;
    }

    my @spells = (315, 316, 317, 58, 398, 399, 400, 397, 338, 491, 351, 2612, 285, 681, 295, 682);

    if($lv > 10)
    {
        @spells = (683, 684, 2633, 362, 492, 440, 402, 403, 404, 401, 336, 395, 396, 335, 497, 498, 499);
    }

    if($lv > 20)
    {
        @spells = (685, 686, 2614, 2616, 493, 441, 573, 576, 575, 574);
    }

    if($lv > 30)
    {
        @spells = (164, 688, 687, 2618, 494, 442, 624, 627, 626, 625);
    }

    if($lv > 40)
    {
        @spells = (577, 165, 166, 689, 690, 2621, 495, 443, 633, 635, 634, 632);
    }

    if($lv > 50)
    {
        @spells = (1574, 1723, 2626, 2627, 1621, 1622, 1623, 1678, 1677, 1675);
    }

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "Your $itemname resonates with hundreds of voices and abruptly goes silent.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
