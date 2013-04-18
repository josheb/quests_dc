sub EVENT_SPAWN
{
    quest::setnexthpevent(60);
}

sub EVENT_HP
{
    quest::say("You shouldn't have interfered, now taste the fury of the Nightkin!");
    my $nnid = quest::spawn2(74129, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
    $nmob = $entity_list->GetMobID($nnid);
    $nnpc = $nmob->CastToNPC();
    $nnpc->SpellFinished(48, $nnpc, 0, -1000);
    $nnpc->AddToHateList($npc->GetHateTop());
    quest::depop_withtimer(74128);
}

#If we get here they knocked the crap out of her too quickly for the HP event to fire.
sub EVENT_DEATH
{
    quest::say("You shouldn't have interfered, now taste the fury of the Nightkin!");
    my $nnid = quest::spawn2(74129, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
    $nmob = $entity_list->GetMobID($nnid);
    $nnpc = $nmob->CastToNPC();
    $nnpc->SpellFinished(48, $nnpc, 0, -1000);
    $nnpc->AddToHateList($npc->GetHateTop());
}
