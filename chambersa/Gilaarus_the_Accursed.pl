my $plevel = 6;

sub EVENT_SPAWN
{
    quest::settimer("plnuke", 15);
    quest::settimer("plspawn", 60);
    quest::shout("Oh hey, it's you!  Thanks for starting the manifestation ritual, I really appreciate it.  The trouble is, I just need a little bit more power before I can transition fully into your plane.");
    quest::shout("I'm going to need you to just go ahead come up here so I can consume your essence.  Don't be selfish now, there's no I in Team!");
    quest::shout("Of course, I'll slowly build in power, so we can just wait, but how boring is that?");
}

sub EVENT_SIGNAL
{
    if($signal == 53009)
    {
        $plevel--;

        quest::shout("That is not cool bro, I kind of need those guys.");

        if($plevel == 0)
        {
            #They're all converted.
            quest::shout("I see how it is.  Fine, have it your way.");
            $npc->ModifyNPCStat('max_hp', 20000);
            $npc->ModifyNPCStat('special_attacks', "fT");
            $npc->ModifyNPCStat('min_hit', "50");
            $npc->ModifyNPCStat('max_hit', "150");
            $npc->ModifyNPCStat('hp_regen', "100");

            quest::stoptimer("plspawn");

            my @cl = $entity_list->GetClientList();
            my $ccl = $cl[0];
            $npc->AddToHateList($ccl, 200);
        }
    }
}

sub EVENT_TIMER
{
    if($timer eq "plnuke")
    {
        my $sp = quest::ChooseRandom(6162, 3973, 2909, 3622, 1638, 1037, 2667, 2809, 3853, 4908);
        my @cl = $entity_list->GetClientList();
        my $ccl = $cl[0];

        my $dst = $npc->CalculateDistance($ccl->GetX(), $ccl->GetY(), $ccl->GetZ());

        if($dst < 150)
        {
            my @says = (
                "You're just delaying the inevitable.",
                "This will hurt a lot less if you just come up and let me eat you.",
                "I thought we were friends?  A real friend would condemn themselves to an eternity of servitude.",
                "If you keep hanging out with that elf chick down there, I just don't think we can be bros.",
                "This is hurting me more than it hurts you!  Well, not really, I've just always wanted to say that.",
                "You're still alive?  INCONCEIVABLE!"
            );
            quest::shout(quest::ChooseRandom(@says));
            #$npc->CastSpell($sp, $ccl->GetID(), 10, 2000, 0);
            $npc->SpellFinished($sp, $ccl, 0, -1000);
        }
    }

    if($timer eq "plspawn")
    {
        my $spid = quest::ChooseRandom(304022, 304023, 304024, 304025, 304026);
        my $nid = quest::spawn2($spid, 0, 0, -77.3, 272.8, 53.2, 81.2);

        my @cl = $entity_list->GetClientList();
        my $enmob = $entity_list->GetNPCByID($nid);
        my $ccl = $cl[0];

        $enmob->AddToHateList($ccl, 200);
    }
}
