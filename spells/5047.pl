sub EVENT_SPELL_EFFECT_CLIENT
{
    $caster = $entity_list->GetClientByID($caster_id);

    #$caster->Message(315, "$zonesn - $zoneln - $zoneid");

    my $sbid = 0;
    my $fid = 0;
    my $x = 0;

    my $nextid = $qglobals{"cbtotal"} + 1;

    #$caster->Message(315, "$nextid--");

    for($x = 1; $x < 11; $x++)
    {
        if( !defined $qglobals{"cbind_".$zonesn."-".$x} )
        {
            $sbid = "cbind_".$zonesn."-".$x;
            $fid = $x;
            last;
        }
    }

    #$caster->Message(315, "$sbid--");

    if($fid == 0) { $caster->Message(15, "You can't have that many binds in one zone!"); return; }

    my $wpstr = "$zoneln|$zoneid|$fid|" . int($caster->GetX()) . "|". int($caster->GetY()) . "|" . int( $caster->GetZ() );
    $caster->Message(14, "You have established a new waypoint!");
    $caster->SetGlobal("cbentry-$nextid", "$wpstr", 5, "F");
    $caster->SetGlobal("cbtotal", $nextid, 5, "F");
    $caster->SetGlobal($sbid, 1, 5, "F");
}
