sub EVENT_SAY
{
    if($text=~/greetings nightsister/i)
    {
        plugin::ClientSay("Greetings interloper.  Your aura does not bear our mark, and I can smell the blood of my packmates on your hands!");
        $client->UpdateTaskActivity(262, 0, 1);
        $npc->AddToHateList($client->CastToMob());
    }
}

sub EVENT_SPAWN
{
    quest::setnexthpevent(60);
}

sub EVENT_HP
{
    quest::say("Prepare yourself for the wrath of the Nightkin!");
    my $nnid = quest::spawn2(19201, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
    $nmob = $entity_list->GetMobID($nnid);
    $nnpc = $nmob->CastToNPC();
    $nnpc->SpellFinished(48, $nnpc, 0, -1000);
    $nnpc->AddToHateList($npc->GetHateTop());
    quest::depop_withtimer(19200);
}

#If we get here they knocked the crap out of her too quickly for the HP event to fire.
sub EVENT_DEATH
{
    quest::say("Prepare yourself for the wrath of the Nightkin!");
    my $nnid = quest::spawn2(19201, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
    $nmob = $entity_list->GetMobID($nnid);
    $nnpc = $nmob->CastToNPC();
    $nnpc->SpellFinished(48, $nnpc, 0, -1000);
    $nnpc->AddToHateList($npc->GetHateTop());
}
