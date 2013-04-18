sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $en = $client->GetAggroCount();
    my $hpp = $client->GetMaxHP() / $client->GetHP();

    #Only proc in combat
    if($en < 1) { return; }

    my @mobs = $entity_list->GetNPCList();
    $cid = 0;
    $ch = 0;
    $cm = 0;

    foreach $m (@mobs)
    {
        $ha = $m->GetHateAmount($client);
        if($ha > $ch)
        {
            $cid = $m->GetID();
            $cm = $m;
        }
    }

    #No hate
    if($cid < 1) { return; }

    my @hspells = (301, 192);
    my @mspells = (188, 190);

    if($lv > 45)
    {
        push(@mspells, 1691);
        push(@mspells, 1692);
        push(@hspells, 1714);
        push(@hspells, 3229);
    }

    my $sp = 0;

    if($hpp < 2)
    {
        $sp = quest::ChooseRandom(@hspells);
    }
    else
    {
        $sp = quest::ChooseRandom(@mspells);
    }

    $client->Message(15, "The $itemname produces a soothing aura.");
    #$client->CastSpell($sp, $cid, 10, 0, 0);
    $client->SpellFinished($sp, $cm, 0, -1000);
}
