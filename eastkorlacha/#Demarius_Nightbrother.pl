sub EVENT_SPAWN
{
    quest::settimer("statcheck", 1);
}

sub EVENT_TIMER
{
    #Look for our various shrooms and figure out what stats should be
    #special_attacks
    #hp_regen

    my $steel = $entity_list->GetMobByNpcTypeID(363029);
    my $magic = $entity_list->GetMobByNpcTypeID(363030);
    my $regen = $entity_list->GetMobByNpcTypeID(3632);
    my $slow = $entity_list->GetMobByNpcTypeID(363031);

    my $sa = "RrTMCNIDfWL";
    my $rg = 400;

    if($steel) { $sa .= "A"; } #Immune to Melee
    if($magic) { $sa .= "B"; } #Immune to Magic
    if($slow)  { $sa .= "U"; } #Immune to Slow
    if($regen) { $rg = 2000; }

    #Update!
    $npc->ModifyNPCStat("special_attacks", $sa);
    $npc->ModifyNPCStat("hp_regen", $rg);
}
