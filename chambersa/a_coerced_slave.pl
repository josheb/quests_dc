my @spells = (27323, 27324);
my $nstate = 0;

sub EVENT_SPAWN
{

}

sub EVENT_SIGNAL
{
    #quest::shout("-- " . $signal);

    #Freedom!
    if($signal == 53001)
    {
        if($nstate == 0)
        {
            my $nid = $npc->GetID();

            $npc->TempName("a_released_slave");
            $npc->Shout("At last, I am free!  Now I offer my power willingly to see you banished once again!");

            $nstate = 1;

            my $gn = $entity_list->GetNPCByNPCTypeID(304014);
            $gn->SignalNPC(53009);
        }
        return;
    }

    if($signal == 53003)
    {
        if($nstate == 0)
        {
            my $gn = $entity_list->GetNPCByNPCTypeID(304014);
            my $sp = quest::ChooseRandom(@spells);
            $npc->CastSpell($sp, $gn->GetID(), 10, 2000, 0);
        }
        else
        {
            my @cl = $entity_list->GetClientList();
            my $ccl = $cl[0];
            my $sp = quest::ChooseRandom(@spells);
            $npc->CastSpell($sp, $ccl->GetID(), 10, 2000, 0);
        }
    }
}
