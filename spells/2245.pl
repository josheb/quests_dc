sub EVENT_SPELL_EFFECT_CLIENT
{
    if($client->GetLevel() != 52)
    {
        $client->Message(15, "Your Accursed Gauntlets say: You really want to do that again?  No thanks, I've had enough of you.");
        return;
    }

    $caster = $entity_list->GetClientByID($caster_id);

    my $glv = $qglobals{'g53level'};
    my $tc = $qglobals{'q53tiraela'};
    
    if($glv < 41 && $tc != 1)
    {
        $client->Message(15, "Your Accursed Gauntlets say: I'm not powerful enough to begin the ritual yet, we need to keep gathering essence!");
        return;
    }

 

    if($tc != 1)
    {
        #$client->Message(315, "Spawning Tiraela");
        #First at required level, summon a hostile Tiraela.
        my $tid = quest::spawn2(22212, 0, 0, $client->GetX(), $client->GetY(), $client->GetZ(), 0);
        my $tnpc = $entity_list->GetNPCByID($tid);
        $tnpc->AddToHateList($caster, 200);
        #Go ahead and set the flag, they don't need the HP event to proceed
        $client->SetGlobal('q53tiraela', 1, 5, "F");
    }
    else
    {
        #$client->Message(315, "TP to chambers");
        #Second cast we port you to chambersa instance.
        my $newiid = quest::CreateInstance("chambersa", 0, 3600);
        $client->AssignToInstance($newiid);
        $client->MovePCInstance(304, $newiid, 0, 0, 0, 254);
    }
}