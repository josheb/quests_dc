sub showActiveAchievements
{
    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    $client->Message(15, "Active Achievements:");

    plugin::displayActive("TOTALKILLS", "Kills");
    plugin::displayActive("ORCKILLS", "Orc Kills");
    plugin::displayActive("KOBOLDKILLS", "Kobold Kills");
    plugin::displayActive("GIANTKILLS", "Giant Kills");
    plugin::displayActive("DRAGONKILLS", "Dragon Kills");
    plugin::displayActive("wptotal", "Waypoints");
}

sub displayActive
{
    my %active;
    my $type = shift;
    my $ftitle = shift;

    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    if($type eq "TOTALKILLS") { %active = %ac_kills; }
    if($type eq "ORCKILLS") { %active = %ac_orc_kills; }
    if($type eq "KOBOLDKILLS") { %active = %ac_kobold_kills; }
    if($type eq "GIANTKILLS") { %active = %ac_giant_kills; }
    if($type eq "DRAGONKILLS") { %active = %ac_dragon_kills; }
    if($type eq "wptotal") { %active = %ac_waypoints; }

    $tk = int($qglobals->{$type});
    if($tk > 0)
    {
        $client->Message(15, "Total $ftitle: $tk");
        foreach $k (sort {$a <=> $b} (keys(%active)))
        {
            my $title = $active{$k}{"title"};
            if($tk < $k)
            {
                $client->Message(15, "* - ($tk / $k) $title");
                last;
            }
        }
    }
}

sub showPendingAchievements
{
    my $showdone = shift;

    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    plugin::displayPending("TOTALKILLS", $showdone, "Kill");
    plugin::displayPending("ORCKILLS", $showdone, "Orc Kill");
    plugin::displayPending("KOBOLDKILLS", $showdone, "Kobold Kill");
    plugin::displayPending("GIANTKILLS", $showdone, "Giant Kill");
    plugin::displayPending("DRAGONKILLS", $showdone, "Dragon Kill");
    plugin::displayPending("wptotal", $showdone, "Waypoint");
}

sub displayPending
{
    my %active;
    my $type = shift;
    my $showdone = shift;
    my $ftitle = shift;

    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    my $count = int($qglobals->{$type});

    if($type eq "TOTALKILLS") { %active = %ac_kills; }
    if($type eq "ORCKILLS") { %active = %ac_orc_kills; }
    if($type eq "KOBOLDKILLS") { %active = %ac_kobold_kills; }
    if($type eq "GIANTKILLS") { %active = %ac_giant_kills; }
    if($type eq "DRAGONKILLS") { %active = %ac_dragon_kills; }
    if($type eq "wptotal") { %active = %ac_waypoints; }

    my @aclist = ();
    foreach $k (keys(%active))
    {
        if($count >= $k)
        {
            my $gv = $type."_".$k."_DONE";
            if( !defined $qglobals->{$gv} || $showdone )
            {
                push(@aclist, $k);
            }
        }
    }

    my $tac = @aclist;
    my $ae;

    if($tac > 0)
    {
        $client->Message(14, "$ftitle Achievements:");
        foreach $ae (@aclist)
        {
            my $msg;
            if($showdone) { $msg = "* - " . $active{$ae}{"title"}; }
            else
            {
                my $l_redeem = quest::saylink("%!!acredeem|$type|$ae", 1, "Redeem");
                $msg = "* - [$l_redeem] - " . $active{$ae}{"title"};
            }
            $client->Message(15, $msg);
        }
        $client->Message(14, "$tac Achievements.  Count: $count");
    }
}

sub redeemAchievement
{
    my $txt = shift;

    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    my ($rs, $type, $val) = split(/\|/, $txt);

    my $cval = $qglobals->{$type};
    if($cval < $val) { $client->Message(315, "You have not completed this achievement!"); return; }

    if( defined $qglobals->{$type."_".$val."_DONE"} )
    {
        $client->Message(315, "You have already redeemed this achievement.");
        return;
    }

    my %active;

    if($type eq "TOTALKILLS") { %active = %ac_kills; }
    if($type eq "ORCKILLS") { %active = %ac_orc_kills; }
    if($type eq "KOBOLDKILLS") { %active = %ac_kobold_kills; }
    if($type eq "GIANTKILLS") { %active = %ac_giant_kills; }
    if($type eq "DRAGONKILLS") { %active = %ac_dragon_kills; }
    if($type eq "wptotal") { %active = %ac_waypoints; }

    $qttl = "Achievement: " . $active{$val}{"title"};
    $qtxt = $active{$val}{"message"};
    if( $active{$val}{"exp"} > 0) { quest::exp($active{$val}{"exp"}); }
    if( $active{$val}{"titleset"} > 0) { quest::enabletitle($active{$val}{"titleset"}); $qtxt .= "<br>You have earned new titles!"; }
    quest::popup($qttl, $qtxt);
    foreach $sp ( @{$active{$val}{"spells"}} ) { $client->SpellFinished($sp, $client, 0); }
    foreach $it ( @{$active{$val}{"items"}} ) { quest::summonitem($it); }
    $client->SetGlobal($type."_".$val."_DONE", 1, 5, "F");

    $client->SetHP($client->GetMaxHP());
    $client->SetMana($client->GetMaxMana());
}

sub ACNotify
{
    my $pa = shift;
    my $lpa = shift;

    my $client = plugin::val('client');

    if($pa > 0)
    {
        my $l_aclist = quest::saylink("%!!pendingachievements", 1, "Show Pending Achievements");
        $client->Message(14, "You have $pa achievements to redeem!");
        $client->Message(14, "* - $l_aclist");

        if($lpa != $pa)
        {
            quest::popup("New Achievement!", "You have $pa achievements to redeem!<br>Type !pendingachievements in chat to view them.<br>Type !help for a list of other commands.");
        }
    }
}

return 1;
