sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $en = $client->GetAggroCount();
    my $hpp = $client->GetMaxHP() / $client->GetHP();

    if($en > 0)
    {
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

        my @hspells = (54, 376, 676, 41);

        if($lv > 10)
        {
            @hspells = (383, 521, 281, 657, 386, 526);
        }

        if($lv > 20)
        {
            @hspells = (467, 470, 350, 185, 162, 450);
        }

        if($lv > 30)
        {
            @hspells = (31, 111, 463, 658, 466, 180, 73, 163);
        }

        if($lv > 40)
        {
            @hspells = (507, 112, 32, 23, 73, 1421, 731, 181, 673, 195);
        }

        if($lv > 50)
        {
            @hspells = (1588, 1592, 3574, 1577, 1634, 1645, 1656, 1640, 1698, 1703);
        }

        my $sp = quest::ChooseRandom(@hspells);
        $client->Message(15, "The $itemname flares angrily.");
        #$client->CastSpell($sp, $cid, 10, 0, 0);
        $client->SpellFinished($sp, $cm, 0, -1000);
        return;
    }

    #Make these more rare than our battle probability
    my $debuff = rand(100);
    if($debuff < 70) { return; }

    #Mildly inconvenient OOC spells
    my @spells = (216, 290, 303, 2167);

    my $sp = quest::ChooseRandom(@spells);

    $client->Message(15, "The $itemname hungers for battle.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
