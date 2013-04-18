#Waypoint Gate
sub EVENT_SPELL_EFFECT_CLIENT
{
    $caster = $entity_list->GetClientByID($caster_id);

    #Set a qglobal for however long they get to pick a zone.  It has to be set for the serverman commands to work.
    #This keeps people from figuring out what text to send without the cast time.

    #30 seconds?
    $client->SetGlobal('gatestonetime', 1, 5, "S30");

    my $tbinds = $qglobals{"wptotal"};
    $client->Message(315, "You have knowledge of the following places:");
    for($x = 1; $x <= $tbinds; $x++)
    {
        my $wp = $qglobals{"wpentry-$x"};
        my @wpd = split(/\|/, $wp);
        my $l_wp = quest::saylink("%!!wpgoto-$x", 1, $wpd[0]);
        $client->Message(315, "$x - $l_wp");
    }

    my $cbinds = $qglobals{"cbtotal"};
    if($cbinds > 0)
    {
        $client->Message(315, "Bindstone Locations:");
        for($x = 1; $x <= $cbinds; $x++)
        {
            my $wp = $qglobals{"cbentry-$x"};
            my @wpd = split(/\|/, $wp);
            my $l_wp = quest::saylink("%!!cbgoto-$x", 1, $wpd[0]." - ".$wpd[2]);
            $client->Message(315, "$x - $l_wp");
        }
    }
}
