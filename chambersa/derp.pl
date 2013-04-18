sub EVENT_SPAWN
{
    quest::set_proximity($x - 70, $x + 70, $y - 70, $y + 70);
}

sub EVENT_ENTER
{
    if($qglobals{'53evstart'} != 1)
    {
        #$client->Message(315, "Event starting");
        quest::setglobal('53evstart', 1, 5, 'H5');

        quest::spawn2(304014, 0, 0, -210.4, 271.3, 65.2, 63.2);

        quest::settimer("sl1", 60);
        quest::settimer("sl2_start", 10);
        quest::settimer("sl3_start", 20);
        quest::settimer("sl4_start", 30);
        quest::settimer("sl5_start", 40);
        quest::settimer("sl6_start", 50);
   }
}

sub EVENT_TIMER
{
    if($timer eq "sl2_start")
    {
        quest::stoptimer("sl2_start");
        quest::settimer("sl2", 60);
        return;
    }

    if($timer eq "sl3_start")
    {
        quest::stoptimer("sl3_start");
        quest::settimer("sl3", 60);
        return;
    }

    if($timer eq "sl4_start")
    {
        quest::stoptimer("sl4_start");
        quest::settimer("sl4", 60);
        return;
    }

    if($timer eq "sl5_start")
    {
        quest::stoptimer("sl5_start");
        quest::settimer("sl5", 60);
        return;
    }

    if($timer eq "sl6_start")
    {
        quest::stoptimer("sl6_start");
        quest::settimer("sl6", 60);
        return;
    }

    if($timer eq "sl1")
    {
        #quest::shout("t1");
        my $cn = $entity_list->GetNPCByNPCTypeID(304015);
        $cn->SignalNPC(53003);
    }

    if($timer eq "sl2")
    {
        #quest::shout("t2");
        my $cn = $entity_list->GetNPCByNPCTypeID(304016);
        $cn->SignalNPC(53003);
    }

    if($timer eq "sl3")
    {
        #quest::shout("t3");
        my $cn = $entity_list->GetNPCByNPCTypeID(304017);
        $cn->SignalNPC(53003);
    }

    if($timer eq "sl4")
    {
        #quest::shout("t4");
        my $cn = $entity_list->GetNPCByNPCTypeID(304018);
        $cn->SignalNPC(53003);
    }

    if($timer eq "sl5")
    {
        #quest::shout("t5");
        my $cn = $entity_list->GetNPCByNPCTypeID(304019);
        $cn->SignalNPC(53003);
    }

    if($timer eq "sl6")
    {
        #quest::shout("t6");
        my $cn = $entity_list->GetNPCByNPCTypeID(304020);
        $cn->SignalNPC(53003);
    }
}

sub EVENT_SIGNAL
{

}
