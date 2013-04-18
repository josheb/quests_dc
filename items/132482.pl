sub EVENT_ITEM_TICK
{
    if($client->GetLevel() != 52)
    {
        my $sp = quest::ChooseRandom(660, 731, 252, 258, 264, 360, 1511, 451, 455, 435, 559, 1542, 420, 6, 1601, 4105, 436, 1620, 1716, 1615, 2518, 3473, 6162, 3973, 2909, 3622, 1638, 1037, 2667, 2809, 3853, 4908);
        $client->Message(14, "I'm just not crazy about spending the rest of my practically infinite life on your hands, so howsabout you just toss me back on the ground mmmkay?");
        $client->Message(15, "The Accursed Gauntlets glow red.");
        #$client->CastSpell($sp, $client->GetID(), 10, 0, 0, -1000);
        $client->SpellFinished($sp, $client, 0, -1000);
        return;
    }

    #Do nothing in the event zone
    if($zonesn eq "chambersa") { return; }

    if(!defined($qglobals{'start53'}))
    {
        $client->SetGlobal("start53", 1, 5, "F");
        my $qtext = "Hello there!<br>You have lovely hands, has anyone ever told you that?<br>I can't wait to see what adventures you take me on.  I just know we'll be the best of friends!";
        quest::popup("Gauntlets of the Accursed", $qtext);
        $client->SetGlobal("g53level", 1, 5, "F");
        $client->SetGlobal("g53tick", 1, 5, "F");
        return;
    }

    #No grouping!
    my $grp = $client->GetGroup();
    if($grp)
    {
        #From the level 40 set
        my $sp = quest::ChooseRandom(6162, 3973, 2909, 3622, 1638, 1037, 2667, 2809, 3853, 4908);
        $client->Message(315, "Your Accursed Gauntlets say: We don't need any help and I don't trust your buddies, so I suggest you part company.");
        $grp->CastGroupSpell($client, $sp);
    }


    my $glv = $qglobals{'g53level'};
    if($glv < 1) { $glv = 1; }
    my $rkey = plugin::getRaceKey($glv-1);
    my $tc = $qglobals{'g53tick'};

    $client->SetGlobal("g53tick", $tc+1, 5, "F");

    #Spawn a fury from time to time
    if(int(rand(100)) > 90 && $qglobals{'sq53time'} != 1)
    {
        my $n = quest::spawn2(409255, 0, 0, $client->GetX(), $client->GetY(), $client->GetZ(), 124.6);
        my $nh = $entity_list->GetMobByID($n);
        $nh->AddToHateList($client, 100);
        $client->Message(15, "A nether being is drawn to the Accursed Gauntlets!");
        #set a wait mark
        my $waittime = (int(rand(10)) + 1) * 30;
        $client->SetGlobal('sq53time', 1, 5, "S$waittime");
    }

    if($tc < 3) { return; }
    #use 3 so we have some buffer between kills
    if($tc == 3)
    {
        if($glv <= 8)
        {
            $client->Message(14, "Your Accursed Gauntlets say:  I'm craving some $rkey.  We should go find one and kill it.  You know, for the greater good.");
            return; 
        }

        if($glv > 8 && $glv <= 16)
        {
            $client->Message(14, "Your Accursed Gauntlets say: We need $rkey.  What do you say?");
            return;
        }

        if($glv > 16 && $glv <= 24)
        {
            $client->Message(14, "Your Accursed Gauntlets say: Lets go get some $rkey.  I think you're starting to enjoy this as much as I do.");
            return;
        }

        if($glv > 24 && $glv <= 32)
        {
            $client->Message(14, "Your Accursed Gauntlets say: We need $rkey next.  Are you starting to feel the power grow?");
            return;
        }

        if($glv > 32 && $glv <= 40)
        {
            $client->Message(14, "Your Accursed Gauntlets say: Hurry, we must feed on $rkey soon.");
            return;
        }

        if($glv > 40)
        {
            $client->Message(14, "Your Accursed Gauntlets say: I am at full power.  You must activate the vessel I am trapped in to reach our ultimate ascendance!");
            return;
        }
    }

    #5 mins
    if($tc == 30)
    {
        if($glv > 40)
        {
            $client->Message(14, "Your Accursed Gauntlets say: We're so close, what are you waiting for!?  Begin the invocation!");
            return;
        }

        $client->Message(14, "Your Accursed Gauntlets say: I hope you're hunting $rkey, we need this if we are to proceed.");
        return;
    }

    #10 mins
    if($tc == 60)
    {
        if($glv > 40)
        {
            $client->Message(14, "Your Accursed Gauntlets say: We're so close, what are you waiting for!?  Begin the invocation!");
            return;
        }

        $client->Message(14, "Your Accursed Gauntlets say: I don't know what's holding us up, but you need to get moving.  We need $rkey NOW!");
        return;
    }

    #15 mins
    if($tc == 90)
    {
        if($glv > 40)
        {
            $client->Message(14, "Your Accursed Gauntlets say: We're so close, what are you waiting for!?  Begin the invocation!");
            return;
        }

        $client->Message(14, "Your Accursed Gauntlets say: Are you taking this seriously?  We need $rkey.  If I don't think I have your full attention, things could become unpleasant between us.");
        return;
    }

    #20 mins and on
    if($tc > 120)
    {
        my $dobad = rand(100);
        if($dobad < 70) { return; }

        if($glv <= 40)
        {
            my @ptexts = array(
                "I will chain you to a pipe in a crawlspace if you don't get that $rkey!",
                "I asked you for $rkey and what do we have?  Nothing.  This is for your own good, I'm just trying to get your attention.",
                "I will PUNCH YOU IN THE FACE if you don't get some $rkey!",
                "I need you to do me a favor and get that $rkey, can you be a buddy and just kill us some $rkey?",
                "Listen crybaby, I will downsize your face with a shovel if you don't get that $rkey!",
                "Hey dork, quit hitting yourself.  Quit hitting yourself!"
            );

            my $pmsg = quest::ChooseRandom(@ptexts);
            $client->Message(14, "Your Accursed Gauntlets say: $pmsg");
        }
        else
        {
            $client->Message(14, "Your Accursed Gauntlets say: I can't believe you've let this go so long.  Maybe if you die someone who really wants to maximize their potential will scavenge me from your filthy corpse.");
        }

        if($glv <= 8)
        {
            my $sp = quest::ChooseRandom(660, 731, 252, 258, 264, 360, 1511, 6162, 3973, 2909, 3622, 1638, 1037, 2667, 2809, 3853, 4908);
            $client->Message(15, "The Accursed Gauntlets glow red.");
            #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
            $client->SpellFinished($sp, $client, 0, -1000);
            return; 
        }

        if($glv > 8 && $glv <= 16)
        {
            my $sp = quest::ChooseRandom(660, 731, 252, 258, 264, 360, 1511, 451, 455, 435, 6162, 3973, 2909, 3622, 1638, 1037, 2667, 2809, 3853, 4908);
            $client->Message(15, "The Accursed Gauntlets glow red.");
            #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
            $client->SpellFinished($sp, $client, 0, -1000);
            return;
        }

        if($glv > 16 && $glv <= 24)
        {
            my $sp = quest::ChooseRandom(660, 731, 252, 258, 264, 360, 1511, 451, 455, 435, 559, 1542, 420, 6162, 3973, 2909, 3622, 1638, 1037, 2667, 2809, 3853, 4908);
            $client->Message(15, "The Accursed Gauntlets glow red.");
            #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
            $client->SpellFinished($sp, $client, 0, -1000);
            return;
        }

        if($glv > 24 && $glv <= 32)
        {
            my $sp = quest::ChooseRandom(660, 731, 252, 258, 264, 360, 1511, 451, 455, 435, 559, 1542, 420, 6, 1601, 6162, 3973, 2909, 3622, 1638, 1037, 2667, 2809, 3853, 4908);
            $client->Message(15, "The Accursed Gauntlets glow red.");
            #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
            $client->SpellFinished($sp, $client, 0, -1000);
            return;
        }

        if($glv > 32 && $glv <= 40)
        {
            my $sp = quest::ChooseRandom(660, 731, 252, 258, 264, 360, 1511, 451, 455, 435, 559, 1542, 420, 6, 1601, 4105, 436, 1620, 1716, 6162, 3973, 2909, 3622, 1638, 1037, 2667, 2809, 3853, 4908);
            $client->Message(15, "The Accursed Gauntlets glow red.");
            #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
            $client->SpellFinished($sp, $client, 0, -1000);
            return;
        }

        if($glv > 40)
        {
            my $sp = quest::ChooseRandom(660, 731, 252, 258, 264, 360, 1511, 451, 455, 435, 559, 1542, 420, 6, 1601, 4105, 436, 1620, 1716, 1615, 2518, 3473, 6162, 3973, 2909, 3622, 1638, 1037, 2667, 2809, 3853, 4908);
            $client->Message(15, "The Accursed Gauntlets glow red.");
            #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
            $client->SpellFinished($sp, $client, 0, -1000);
            return;
        }
    }

    #50/50
    if(rand(100) > 50) { return; }

    #Try not to spam
    if( $qglobals{'s132482time'} == 1 )
    {
        return;
    }
    my $waittime = (int(rand(5)) + 1) * 10;
    $client->SetGlobal('s132482time', 1, 5, "S$waittime");

    #If we haven't triggered a return yet, we remind the wearer what we're after.
    my @phrases = (
        "I'm glad we get along so well.  Maybe after we clobber this $rkey we can go for ice cream!",
        "You know why I like you?  You're a positive thinker and a go-getter.  We have real synergy and once we've taken out that $rkey we can start working toward bigger and better things.",
        "Don't think of what we do as murder or killing, it's not like that.  This $rkey is simply undergoing an essence relocation.",
        "Are you ready to hunt down that $rkey and do some soul dislocation?  I can hardly wait!",
        "We need to maximize our $rkey killing potential, you feeling me bro?",
        "After we hit this $rkey you should look up the manicurist I used to visit in old Paineel.  She could do wonders for your cuticles.",
        "Keep your eye on the prize, my friend.  $rkey.",
        "Can I ask you for a personal favor?  When this next $rkey goes down, can you put your hand on it, you know, the hand you're wearing me on?  I just like to feel the warmth recede, it...it's kind of strange, forget I said anything.",
        "In the grand scheme of things, one less $rkey isn't going to make any difference in the world, but it's a huge gain for us.",
        "Whether it's some high planar figure or the lowly $rkey we currently seek, they always get that pouty look before the end.  You'll learn to cherish that."
    );

    my $ptxt = quest::ChooseRandom(@phrases);
    $client->Message(315, "Your Accursed Gauntlets say: $ptxt");
}
