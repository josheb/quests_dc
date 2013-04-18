sub EVENT_AGGRO
{
    quest::shout("I'm sorry it has come to this.  Perhaps you will see more clearly in your next life.");
}

sub EVENT_SPAWN
{
    quest::setnexthpevent(10);
}

sub EVENT_HP
{
    quest::shout("You will soon discover the consequences of your foolishness!");
    my $nnid = quest::spawn2(363033, 0, 0, 1463, 385, -130, 124);
    $nmob = $entity_list->GetMobID($nnid);
    $nnpc = $nmob->CastToNPC();
    $nnpc->SpellFinished(48, $nnpc, 0, -1000);
    $nnpc->AddToHateList($npc->GetHateTop());
    quest::depop_withtimer(363028);
}

#If we get here they knocked the crap out of him too quickly for the HP event to fire.
sub EVENT_DEATH
{
    quest::shout("You will soon discover the consequences of your foolishness!");
    my $nnid = quest::spawn2(363033, 0, 0, 1463, 385, -130, 124);
    $nmob = $entity_list->GetMobID($nnid);
    $nnpc = $nmob->CastToNPC();
    $nnpc->SpellFinished(48, $nnpc, 0, -1000);
    $nnpc->AddToHateList($npc->GetHateTop());
}
