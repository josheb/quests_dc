sub showActiveAchievements
{
    my $client = plugin::val('client');
    my $qglobals = plugin::var('qglobals');

    $client->Message(15, "Active Achievements:");

    my $tk = int($qglobals->{'TOTALKILLS'});
    $client->Message(15, "Total Kills: $tk");
    foreach $k (sort {$a <=> $b} (keys(%ac_kills)))
    {
        my $title = $ac_kills{$k}{"title"};
        if($tk < $k)
        {
            $client->Message(15, "* - ($tk / $k) $title");
            last;
        }
    }

    $tk = int($qglobals->{'ORCKILLS'});
    if($tk > 0)
    {
        $client->Message(15, "Total Orc Kills: $tk");
        foreach $k (sort {$a <=> $b} (keys(%ac_orc_kills)))
        {
            my $title = $ac_orc_kills{$k}{"title"};
            if($tk < $k)
            {
                $client->Message(15, "* - ($tk / $k) $title");
                last;
            }
        }
    }

    $tk = int($qglobals->{'KOBOLDKILLS'});
    if($tk > 0)
    {
        $client->Message(15, "Total Kobold Kills: $tk");
        foreach $k (sort {$a <=> $b} (keys(%ac_kobold_kills)))
        {
            my $title = $ac_kobold_kills{$k}{"title"};
            if($tk < $k)
            {
                $client->Message(15, "* - ($tk / $k) $title");
                last;
            }
        }
    }

    $tk = int($qglobals->{'GIANTKILLS'});
    if($tk > 0)
    {
        $client->Message(15, "Total Giant Kills: $tk");
        foreach $k (sort {$a <=> $b} (keys(%ac_giant_kills)))
        {
            my $title = $ac_giant_kills{$k}{"title"};
            if($tk < $k)
            {
                $client->Message(15, "* - ($tk / $k) $title");
                last;
            }
        }
    }

    $tk = int($qglobals->{'DRAGONKILLS'});
    if($tk > 0)
    {
        $client->Message(15, "Total Dragon Kills: $tk");
        foreach $k (sort {$a <=> $b} (keys(%ac_dragon_kills)))
        {
            my $title = $ac_dragon_kills{$k}{"title"};
            if($tk < $k)
            {
                $client->Message(15, "* - ($tk / $k) $title");
                last;
            }
        }
    }

    $tk = int($qglobals->{'wptotal'});
    if($tk > 0)
    {
        $client->Message(15, "Total Waypoints: $tk");
        foreach $k (sort {$a <=> $b} (keys(%ac_waypoints)))
        {
            my $title = $ac_waypoints{$k}{"title"};
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


    my $tac = 0;
    my @aclist = ();

    my $tk = $qglobals->{'TOTALKILLS'};
    foreach $k (keys(%ac_kills))
    {
        if($tk >= $k)
        {
            my $gv = "TOTALKILLS_".$k."_DONE";
            if( !defined $qglobals->{$gv} || $showdone )
            {
                push(@aclist, $k);
            }
        }
    }

    $client->Message(14, "Kill Achievements:");
    foreach $ae (@aclist)
    {
        my $msg;
        if($showdone) { $msg = "* - " . $ac_kills{$ae}{"title"}; }
        else
        {
            my $l_redeem = quest::saylink("%!!acredeem|TOTALKILLS|$ae", 1, "Redeem");
            $msg = "* - [$l_redeem] - " . $ac_kills{$ae}{"title"};
        }
        $client->Message(15, $msg);
    }
    $tac = @aclist;
    $client->Message(14, "$tac Achievements.  Kill Count: $tk");

    $tk = $qglobals->{'ORCKILLS'};
    @aclist = ();
    foreach $k (keys(%ac_orc_kills))
    {
        if($tk >= $k)
        {
            my $gv = "ORCKILLS_".$k."_DONE";
            if( !defined $qglobals->{$gv} || $showdone )
            {
                push(@aclist, $k);
            }
        }
    }

    $tac = @aclist;
    if($tac > 0)
    {
        $client->Message(14, "Orc Kill Achievements:");
        foreach $ae (@aclist)
        {
            my $msg;
            if($showdone) { $msg = "* - " . $ac_orc_kills{$ae}{"title"}; }
            else
            {
                my $l_redeem = quest::saylink("%!!acredeem|ORCKILLS|$ae", 1, "Redeem");
                $msg = "* - [$l_redeem] - " . $ac_orc_kills{$ae}{"title"};
            }
            $client->Message(15, $msg);
        }
        $client->Message(14, "$tac Achievements.  Orc Kill Count: $tk");
    }

    $tk = $qglobals->{'KOBOLDKILLS'};
    @aclist = ();
    foreach $k (keys(%ac_kobold_kills))
    {
        if($tk >= $k)
        {
            my $gv = "KOBOLDKILLS_".$k."_DONE";
            if( !defined $qglobals->{$gv} || $showdone )
            {
                push(@aclist, $k);
            }
        }
    }

    $tac = @aclist;
    if($tac > 0)
    {
        $client->Message(14, "Orc Kobold Achievements:");
        foreach $ae (@aclist)
        {
            my $msg;
            if($showdone) { $msg = "* - " . $ac_kobold_kills{$ae}{"title"}; }
            else
            {
                my $l_redeem = quest::saylink("%!!acredeem|KOBOLDKILLS|$ae", 1, "Redeem");
                $msg = "* - [$l_redeem] - " . $ac_kobold_kills{$ae}{"title"};
            }
            $client->Message(15, $msg);
        }
        $client->Message(14, "$tac Achievements.  Kobold Kill Count: $tk");
    }

    $tk = $qglobals->{'GIANTKILLS'};
    @aclist = ();
    foreach $k (keys(%ac_giant_kills))
    {
        if($tk >= $k)
        {
            my $gv = "GIANTKILLS_".$k."_DONE";
            if( !defined $qglobals->{$gv} || $showdone )
            {
                push(@aclist, $k);
            }
        }
    }

    $tac = @aclist;
    if($tac > 0)
    {
        $client->Message(14, "Giant Kill Achievements:");
        foreach $ae (@aclist)
        {
            my $msg;
            if($showdone) { $msg = "* - " . $ac_giant_kills{$ae}{"title"}; }
            else
            {
                my $l_redeem = quest::saylink("%!!acredeem|GIANTKILLS|$ae", 1, "Redeem");
                $msg = "* - [$l_redeem] - " . $ac_giant_kills{$ae}{"title"};
            }
            $client->Message(15, $msg);
        }
        $client->Message(14, "$tac Achievements.  Giant Kill Count: $tk");
    }

    $tk = $qglobals->{'DRAGONKILLS'};
    @aclist = ();
    foreach $k (keys(%ac_dragon_kills))
    {
        if($tk >= $k)
        {
            my $gv = "DRAGONKILLS_".$k."_DONE";
            if( !defined $qglobals->{$gv} || $showdone )
            {
                push(@aclist, $k);
            }
        }
    }

    $tac = @aclist;
    if($tac > 0)
    {
        $client->Message(14, "Dragon Kill Achievements:");
        foreach $ae (@aclist)
        {
            my $msg;
            if($showdone) { $msg = "* - " . $ac_dragon_kills{$ae}{"title"}; }
            else
            {
                my $l_redeem = quest::saylink("%!!acredeem|DRAGONKILLS|$ae", 1, "Redeem");
                $msg = "* - [$l_redeem] - " . $ac_dragon_kills{$ae}{"title"};
            }
            $client->Message(15, $msg);
        }
        $client->Message(14, "$tac Achievements.  Dragon Kill Count: $tk");
    }

    $tk = $qglobals->{'wptotal'};
    @aclist = ();
    foreach $k (keys(%ac_waypoints))
    {
        if($tk >= $k)
        {
            my $gv = "wptotal_".$k."_DONE";
            if( !defined $qglobals->{$gv} || $showdone )
            {
                push(@aclist, $k);
            }
        }
    }

    $tac = @aclist;
    if($tac > 0)
    {
        $client->Message(14, "Waypoint Achievements:");
        foreach $ae (@aclist)
        {
            my $msg;
            if($showdone) { $msg = "* - " . $ac_waypoints{$ae}{"title"}; }
            else
            {
                my $l_redeem = quest::saylink("%!!acredeem|wptotal|$ae", 1, "Redeem");
                $msg = "* - [$l_redeem] - " . $ac_waypoints{$ae}{"title"};
            }
            $client->Message(15, $msg);
        }
        $client->Message(14, "$tac Achievements.  Waypoint Count: $tk");
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

    if($type eq "TOTALKILLS")
    {
        $qttl = $ac_kills{$val}{"title"};
        $qtxt = $ac_kills{$val}{"message"};
        if( $ac_kills{$val}{"exp"} > 0) { quest::exp($ac_kills{$val}{"exp"}); }
        if( $ac_kills{$val}{"titleset"} > 0) { quest::enabletitle($ac_kills{$val}{"titleset"}); $qtxt .= "<br>You have earned new titles!"; }
        quest::popup($qttl, $qtxt);
        foreach $sp ( @{$ac_kills{$val}{"spells"}} ) { $client->SpellFinished($sp, $client, 0); }
        foreach $it ( @{$ac_kills{$val}{"items"}} ) { quest::summonitem($it); }
        $client->SetGlobal($type."_".$val."_DONE", 1, 5, "F");
    }

    if($type eq "ORCKILLS")
    {
        $qttl = $ac_orc_kills{$val}{"title"};
        $qtxt = $ac_orc_kills{$val}{"message"};
        if($ac_orc_kills{$val}{"exp"} > 0) { quest::exp($ac_orc_kills{$val}{"exp"}); }
        if($ac_orc_kills{$val}{"titleset"} > 0) { quest::enabletitle($ac_orc_kills{$val}{"titleset"}); $qtxt .= "<br>You have earned new titles!"; }
        quest::popup($qttl, $qtxt);
        foreach $sp ( @{$ac_orc_kills{$val}{"spells"}} ) { $client->SpellFinished($sp, $client, 0); }
        foreach $it ( @{$ac_orc_kills{$val}{"items"}} ) { quest::summonitem($it); }
        $client->SetGlobal($type."_".$val."_DONE", 1, 5, "F");
    }

    if($type eq "KOBOLDKILLS")
    {
        $qttl = $ac_kobold_kills{$val}{"title"};
        $qtxt = $ac_kobold_kills{$val}{"message"};
        if($ac_kobold_kills{$val}{"exp"} > 0) { quest::exp($ac_kobold_kills{$val}{"exp"}); }
        if($ac_kobold_kills{$val}{"titleset"} > 0) { quest::enabletitle($ac_kobold_kills{$val}{"titleset"}); $qtxt .= "<br>You have earned new titles!"; }
        quest::popup($qttl, $qtxt);
        foreach $sp ( @{$ac_kobold_kills{$val}{"spells"}} ) { $client->SpellFinished($sp, $client, 0); }
        foreach $it ( @{$ac_kobold_kills{$val}{"items"}} ) { quest::summonitem($it); }
        $client->SetGlobal($type."_".$val."_DONE", 1, 5, "F");
    }

    if($type eq "GIANTKILLS")
    {
        $qttl = $ac_giant_kills{$val}{"title"};
        $qtxt = $ac_giant_kills{$val}{"message"};
        if($ac_giant_kills{$val}{"exp"} > 0) { quest::exp($ac_giant_kills{$val}{"exp"}); }
        if($ac_giant_kills{$val}{"titleset"} > 0) { quest::enabletitle($ac_giant_kills{$val}{"titleset"}); $qtxt .= "<br>You have earned new titles!"; }
        quest::popup($qttl, $qtxt);
        foreach $sp ( @{$ac_giant_kills{$val}{"spells"}} ) { $client->SpellFinished($sp, $client, 0); }
        foreach $it ( @{$ac_giant_kills{$val}{"items"}} ) { quest::summonitem($it); }
        $client->SetGlobal($type."_".$val."_DONE", 1, 5, "F");
    }

    if($type eq "DRAGONKILLS")
    {
        $qttl = $ac_dragon_kills{$val}{"title"};
        $qtxt = $ac_dragon_kills{$val}{"message"};
        if($ac_dragon_kills{$val}{"exp"} > 0) { quest::exp($ac_dragon_kills{$val}{"exp"}); }
        if($ac_dragon_kills{$val}{"titleset"} > 0) { quest::enabletitle($ac_dragon_kills{$val}{"titleset"}); $qtxt .= "<br>You have earned new titles!"; }
        quest::popup($qttl, $qtxt);
        foreach $sp ( @{$ac_dragon_kills{$val}{"spells"}} ) { $client->SpellFinished($sp, $client, 0); }
        foreach $it ( @{$ac_dragon_kills{$val}{"items"}} ) { quest::summonitem($it); }
        $client->SetGlobal($type."_".$val."_DONE", 1, 5, "F");
    }

    if($type eq "wptotal")
    {
        $qttl = $ac_waypoints{$val}{"title"};
        $qtxt = $ac_waypoints{$val}{"message"};
        if($ac_waypoints{$val}{"exp"} > 0) { quest::exp($ac_waypoints{$val}{"exp"}); }
        if($ac_waypoints{$val}{"titleset"} > 0) { quest::enabletitle($ac_waypoints{$val}{"titleset"}); $qtxt .= "<br>You have earned new titles!"; }
        quest::popup($qttl, $qtxt);
        foreach $sp ( @{$ac_waypoints{$val}{"spells"}} ) { $client->SpellFinished($sp, $client, 0); }
        foreach $it ( @{$ac_waypoints{$val}{"items"}} ) { quest::summonitem($it); }
        $client->SetGlobal($type."_".$val."_DONE", 1, 5, "F");
    }

#    $client->Message(15, "-" . $client->GetMaxHP());
    $client->SetHP($client->GetMaxHP());
    $client->SetMana($client->GetMaxMana());
}

return 1;
