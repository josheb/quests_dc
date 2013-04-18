sub EVENT_SPAWN
{
    quest::setnexthpevent(60);
}

sub EVENT_HP
{
    if(!$npc->GetHateTop()) { quest::setnexthpevent(60); return; }

    quest::shout("Come to me, my children!");
    $n1 = quest::spawn2(363021, 0, 0, $npc->GetX() + 5, $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
    $n2 = quest::spawn2(363021, 0, 0, $npc->GetX() - 5, $npc->GetY(), $npc->GetZ(), $npc->GetHeading());

    $mob1 = $entity_list->GetMobID($n1);
    $mob2 = $entity_list->GetMobID($n2);

    $mobnpc1 = $mob1->CastToNPC();
    $mobnpc2 = $mob2->CastToNPC();

    $mobnpc1->AddToHateList($npc->GetHateTop());
    $mobnpc2->AddToHateList($npc->GetHateTop());
}

sub EVENT_COMBAT
{
    if($combat_state == 0)
    {
        quest::sethp(100);
        quest::setnexthpevent(60);
    }
}
