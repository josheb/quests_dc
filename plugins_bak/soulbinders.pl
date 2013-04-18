#!/usr/bin/perl

#akanon/Soulbinder_Toglonoit.pl:  plugin::soulbinder_say($text);
#arena/Soulbinder_Gendal.pl:  plugin::soulbinder_say($text);
#butcher/Soulbinder_Tania.pl:    plugin::soulbinder_say($text);
#cabeast/Soulbinder_Shakar.pl:   plugin::soulbinder_say($text);
#crescent/Priestess_Aelea.pl:    plugin::soulbinder_say($text);
#ecommons/Soulbinder_Jubbl.pl:   plugin::soulbinder_say($text);
#erudnext/Soulbinder_Altira_Mamar.pl:    plugin::soulbinder_say($text);
#everfrost/Soulbinder_Garnog.pl: plugin::soulbinder_say($text);
#felwithea/Soulbinder_Elendalira.pl:     plugin::soulbinder_say($text);
#firiona/Soulbinder_Tardon.pl:   plugin::soulbinder_say($text);
#gfaydark/Soulbinder_Oakstout.pl:        plugin::soulbinder_say($text);
#grobb/Soulbinder_Snog.pl:  plugin::soulbinder_say($text);
#gunthak/Soulbinder_Karyin.pl:  plugin::soulbinder_say($text);
#halas/Soulbinder_Jarle.pl:      plugin::soulbinder_say($text);
#iceclad/Soulbinder_Cubnitskin.pl:       plugin::soulbinder_say($text);
#kaladima/Soulbinder_Torvald.pl: plugin::soulbinder_say($text);
#neriaka/Soulbinder_Nola_Z-Ret.pl:       plugin::soulbinder_say($text);
#northkarana/Romi.pl:    plugin::soulbinder_say($text);
#nro/Soulbinder_Ragni.pl:        plugin::soulbinder_say($text);
#oggok/Soulbinder_Trurg.pl:      plugin::soulbinder_say($text);
#overthere/Soulbinder_Kardin.pl: plugin::soulbinder_say($text);
#paineel/Soulbinder_Tomas.pl:    plugin::soulbinder_say($text);
#qeynos/Soulbinder_Novalu.pl:    plugin::soulbinder_say($text);
#rathemtn/Soulbinder_Tak_Thar.pl:    plugin::soulbinder_say($text);
#rivervale/Soulbinder_Hoggle_Grubbytoe.pl:       plugin::soulbinder_say($text);
#shadowhaven/Soulbinder_Nansin.pl:       plugin::soulbinder_say($text);
#sharvahl/Soulbinder_Ghula.pl:   plugin::soulbinder_say($text);
#sro/Soulbinder_Silandra.pl:     plugin::soulbinder_say($text);


#%soulbinders = (
#    ""
#);

sub soulbinder_say {
    my $client = plugin::val('client');
    my $npc = plugin::val('npc');
    my $zonesn = plugin::val('zonesn');
    my $zoneln = plugin::val('zoneln');
    my $zoneid = plugin::val('zoneid');
    my $qglobals = plugin::var('qglobals');

    #Try to untaint zone name for the qglobal
    $zoneln =~ s/'/\\'/g;

#    $client->Message(315, "$zoneln");

	my $text = shift;
	if($text=~/hail/i){
        #my $l_bind = quest::saylink("bind my soul", 1, "bind my soul");
        #my $l_trans = quest::saylink("transport", 1, "transport");
        #my $l_showbind = quest::saylink("available binds", 1, "available binds");

        my $l_bind = quest::saylink("bind my soul", 1, "Bind my soul.");
        my $l_trans = quest::saylink("transport", 1, "Where can you transport me?");
        my $l_showbind = quest::saylink("available binds", 1, "What binds have I found?");

        #Tag them as discovered.
        my $sbid = $npc->GetNPCTypeID() . $zonesn;
        my $nextid = $qglobals->{"wptotal"} + 1;

        if(!$qglobals->{$sbid})
        {
            my $wpstr = "$zoneln|$zoneid|" . int($client->GetX()) . "|". int($client->GetY()) . "|" . int( $client->GetZ() );
            $client->Message(14, "Waypoint discovered!");
            quest::setglobal("wpentry-$nextid", "$wpstr", 5, "F");
            quest::setglobal("wptotal", $nextid, 5, "F");
            quest::setglobal($sbid, 1, 5, "F");
        }

		plugin::ClientSay("Greetings ${name} . When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to bind your soul to this location if that is your wish.");
        plugin::ClientSay("I can also transport you to a limited set of attuned locations, or I can take you to one of your available binds.");
        $client->Message(315, "* - $l_bind");
        $client->Message(315, "* - $l_trans");
        $client->Message(315, "* - $l_showbind");

        my $lpa = int($qglobals->{"lastaccount"});
        my $tb = int($qglobals->{"wptotal"});
        my $pa = 0;
        $pa += plugin::ac_waypoints($tb);

        $client->SetGlobal("lastaccount", $pa, 5, "F");

        #Check last count so we're not spamming the popup every kill
        #if($pa > 0 && $lpa != $pa)
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
	} elsif($text=~/bind my soul/i) {
	    plugin::ClientSay("Binding your soul. You will return here when you die.");
	    quest::selfcast(2049);
	}
    elsif($text=~/available binds/i)
    {
        my $tbinds = $qglobals->{"wptotal"};
        $client->Message(315, "You have knowledge of the following places:");
        for($x = 1; $x <= $tbinds; $x++)
        {
            my $wp = $qglobals->{"wpentry-$x"};
            my @wpd = split(/\|/, $wp);
            my $l_wp = quest::saylink("wpgoto-$x", 1, $wpd[0]);
            $client->Message(315, "$x - $l_wp");
        }

        my $cbinds = $qglobals->{"cbtotal"};
        if($cbinds > 0)
        {
            $client->Message(315, "Bindstone Locations:");
            for($x = 1; $x <= $cbinds; $x++)
            {
                my $wp = $qglobals->{"cbentry-$x"};
                my @wpd = split(/\|/, $wp);
                my $l_wp = quest::saylink("cbgoto-$x", 1, $wpd[0]." - ".$wpd[2]);
                $client->Message(315, "$x - $l_wp");
            }
        }
    }
    elsif($text=~/^wpgoto/i)
    {
        my @v = split(/\-/, $text);
        $wpstr = $qglobals->{"wpentry-$v[1]"};
        @wp = split(/\|/, $wpstr);
        $client->Message(315, "Farewell, be safe in $wp[0]");
        quest::movepc($wp[1], $wp[2], $wp[3], $wp[4]);
    }
    elsif($text=~/^cbgoto/i)
    {
        my @v = split(/\-/, $text);
        $wpstr = $qglobals->{"cbentry-$v[1]"};
        @wp = split(/\|/, $wpstr);
        $client->Message(315, "Farewell, be safe in $wp[0]");
        quest::movepc($wp[1], $wp[3], $wp[4], $wp[5]);
    }
    elsif($text=~/transport/i)
    {
        my $l_gfay = quest::saylink("gfaydark", 1, "Greater Faydark");
        my $l_wc = quest::saylink("commons", 1, "West Commons");
        my $l_qey = quest::saylink("qeytoqrg", 1, "Qeynos Hills");
        my $l_misty = quest::saylink("misty", 1, "Misty Thicket");
        my $l_tox = quest::saylink("tox", 1, "Toxxulia Forest");
        my $l_field = quest::saylink("fieldofbone", 1, "Field of Bone");
        my $l_lake = quest::saylink("lakeofillomen", 1, "Lake of Ill Omen");
        my $l_shade = quest::saylink("shadeweaver", 1, "Shadeweaver's Thicket");
        plugin::ClientSay("Where would you like to go?");
        $client->Message(315, "* - $l_gfay");
        $client->Message(315, "* - $l_wc");
        $client->Message(315, "* - $l_qey");
        #$client->Message(315, "* - $l_misty");
        $client->Message(315, "* - $l_tox");
        $client->Message(315, "* - $l_field");
        $client->Message(315, "* - $l_lake");
        $client->Message(315, "* - $l_shade");
    }
    elsif($text=~/^gfaydark/i)
    {
        quest::movepc(54, 960, -1850, -3.3, 112);
    }
    elsif($text=~/^commons/i)
    {
        quest::movepc(21, 3110.5, -345.1, -48.8, 181.2);
    }
    elsif($text=~/^qeytoqrg/i)
    {
        quest::movepc(4, 750.5, 1053.2, 107.3, 195);
    }
#    elsif($text=~/^misty/i)
#    {
#        quest::movepc(33, 77.5, 112.9, 7, 146.5);
#    }
    elsif($text=~/^tox/i)
    {
        quest::movepc(38, 419.6, -2374.8, -39.8, 190);
    }
    elsif($text=~/^fieldofbone/i)
    {
        quest::movepc(78, 2708.2, -1976.4, 30.2, 88);
    }
    elsif($text=~/^lakeofillomen/i)
    {
        quest::movepc(85, -1907.4, 1653.4, 242.7, 93);
    }
    elsif($text=~/^shadeweaver/i)
    {
        quest::movepc(165, -2022.8, -1847.6, -168.5, 181);
    }
}  

#gfay| 960, -1850, -3.3, 112
#rathemtn| 2073.5, 3659.9, 30.5, 67
#qeytoqrg| 750.5, 1053.2, 107.3, 195
#tox| 419.6, -2374.8, -39.8, 190, 100
#fieldofbone| 2708.2, -1976.4, 30.2, 88
#lakeofillomen| -1907.4, 1653.4, 242.7, 93
#shadeweaver| -2022.8, -1847.6, -168.5, 181
