sub EVENT_CAST_ON
{
#    $client->Message(315, "CAST EVENT");
}

sub EVENT_SAY
{
    if(substr($text, 0, 2) eq "%!")
    { $text = substr($text, 2); }

    if(substr($text, 0, 1) eq "#" || substr($text, 0, 1) eq "!")
    {
        plugin::cmdproc($text);
        return;
    }

#    if($text=~/#show/i)
#    {
#        my $l_test = quest::saylink("%!#svtest", 1, "Can the serverman hear me?");
#
#        $client->Message(315, "Hi - $l_test");
#        return;
#    }

    $client->Message(315, "The auction channel is not currently available.");
}

sub EVENT_SPAWN
{
#    my $l_test = quest::saylink("%!serverman", 1, "Can the serverman hear me?");

#    quest::shout("I live! -- $l_test");
#    quest::shout2("I live!!");
}

sub EVENT_SLAY
{
    #if($client->GetName() ne "Flowers") { return; }
    
    #Set this so the client can respond when they respawn

    if($npcname eq "ENVIRONMENT")
    {
        if(!$qglobals{"TOTALENVDEATHS"}) { $ted = 1; }
        else { $ted = int($qglobals{"TOTALENVDEATHS"}); $ted++; }
        $client->SetGlobal("TOTALENVDEATHS", $ted, 5, "F");
        $client->SetGlobal("IZDED_ENV", 1, 5, "F");
    }
    else
    {
        if(substr($npcname, 0, 7) eq "PLAYER|")
        {
            $client->SetGlobal("IZDED_PLAYER", 1, 5, "F");
            ($tag, $pname) = split(/\|/, $npcname);
            quest::shout2($client->GetName() . " was slain by $pname in a duel to the death!");
        }
        else
        {
            $client->SetGlobal("IZDED", 1, 5, "F");
        }
    }

    if(!$qglobals{"TOTALDEATHS"}) { $td = 1; }
    else { $td = int($qglobals{"TOTALDEATHS"}); $td++; }
    $client->SetGlobal("TOTALDEATHS", $td, 5, "F");

    if($npcname eq "ENVIRONMENT")
    {
        return;
    }

    #We should have NPC name and level here
    #Test for dying to specific mobs or with particular level differences?
    #todo
}

sub EVENT_KILLED_MERIT
{
    my $tk, $ok, $kk, $gk, $dk;
    my $con = $client->GetLevelCon($npclevel);

    #Every kill counts toward the 53 quest
    if($qglobals{"start53"} && $client->GetLevel() == 52)
    {
        my $glv = $qglobals{'g53level'};
        my $rkey = plugin::getRaceKey($glv-1);

        if( plugin::isValid53($rkey, $npcrace) )
        {
            my $qtxt = "That was satisfying wasn't it?<br>Stick with me and nothing will be able to stand against us!";
            quest::popup("Gauntlets of the Accursed", $qtxt);
            $client->SetGlobal("g53level", $glv+1, 5, "F");
            $client->SetGlobal("g53tick", 1, 5, "F");
        }
    }

    #if($client->GetName() ne "Flowers") { return; }

    #$client->Message(315, "$npcname - $npclastname - $npclevel - $bodytype - $npcid - $npcrace - $npcclass");

    #ignore non-exp kills
    if($con < 3) { return; }

    #Total Kills achievements
    if(!$qglobals{"TOTALKILLS"}) { $tk = 1; }
    else { $tk = int($qglobals{"TOTALKILLS"}); $tk++; }
    $client->SetGlobal("TOTALKILLS", $tk, 5, "F");

    if( plugin::isValid53("Orc", $npcrace) )
    {
        #Orc Kills achievements
        if(!$qglobals{"ORCKILLS"}) { $ok = 1; }
        else { $ok = int($qglobals{"ORCKILLS"}); $ok++; }
        $client->SetGlobal("ORCKILLS", $ok, 5, "F");
    }

    if( plugin::isValid53("Kobold", $npcrace) )
    {
        #Kobold Kills achievements
        if(!$qglobals{"KOBOLDKILLS"}) { $kk = 1; }
        else { $kk = int($qglobals{"KOBOLDKILLS"}); $kk++; }
        $client->SetGlobal("KOBOLDKILLS", $kk, 5, "F");
    }

    if( plugin::isValid53("Giant", $npcrace) )
    {
        #Giant Kills achievements
        if(!$qglobals{"GIANTKILLS"}) { $gk = 1; }
        else { $gk = int($qglobals{"GIANTKILLS"}); $gk++; }
        $client->SetGlobal("GIANTKILLS", $gk, 5, "F");
    }

    if( plugin::isValid53("Dragon", $npcrace) )
    {
        #Dragon Kills achievements
        if(!$qglobals{"DRAGONKILLS"}) { $dk = 1; }
        else { $dk = int($qglobals{"DRAGONKILLS"}); $dk++; }
        $client->SetGlobal("DRAGONKILLS", $dk, 5, "F");
    }

    #Guard achievements
    #Boss achievements

    my $lpa = int($qglobals{"lastaccount"});

    my $pa = 0;
    $pa += plugin::ac_kills($tk);
    $pa += plugin::ac_orc_kills($ok);
    $pa += plugin::ac_kobold_kills($kk);
    $pa += plugin::ac_giant_kills($gk);
    $pa += plugin::ac_dragon_kills($dk);

    $client->SetGlobal("lastaccount", $pa, 5, "F");

    plugin::ACNotify($pa, $lpa);

    #Kills by $npcname eval
    #Guard
    #Trooper
    #Deputy
    #Dragoon
    #Bouncer
    #Basher

    #Kills by $npclastname eval
    #Boss tags
}
