sub EVENT_SAY
{
    if($text=~/hail/i)
    {
        if($qglobals{'54pariah'} == 1 && $client->GetLevel() == 50)
        {
            my $expl = 54 * 54 * 54 * 4000;
            my $curaa = $client->GetAAExp();
            $client->SetEXP($expl, $curaa);
            $client->SetLevel(54);
            plugin::ClientSay("Well done, $name.  You have redeemed yourself.");
            $client->SetGlobal("54pariah", 2, 5, "F");
            return;
        }

        my $l_trans = quest::saylink("transcendence", 1, "transcendence");
        if($client->GetLevel() > 49)
        {
            plugin::ClientSay("Hello $name.  Have you come in search of $l_trans?");
        }
        else
        {
            plugin::ClientSay("Be diligent $name, and visit me again when you are stronger.");
        }
    }

    if($text=~/transcendence/i)
    {
        if($client->GetLevel() == 50)
        {
            quest::summonitem(132476);

            my $v_dd = quest::varlink(16884);
            my $v_geb = quest::varlink(4407);
            my $v_eye = quest::varlink(7508);
            my $v_gc = quest::varlink(1402);
            my $v_ste = quest::varlink(9234);
            my $v_ms = quest::varlink(54044);
            my $v_bw = quest::varlink(10376);

            plugin::ClientSay("Very well, but the path to surpassing your mortal bonds is not an easy one.");
            $client->Message(315, "Take this Lab of Disenchantment.  You must fill it with powerful artifacts and extract their magical essence and the echos of their many wielders.");
            $client->Message(315, "You will need:");
            $client->Message(315, "* - $v_dd");
            $client->Message(315, "* - $v_geb");
            $client->Message(315, "* - $v_eye");
            $client->Message(315, "* - $v_gc");
            $client->Message(315, "* - $v_ste");
            $client->Message(315, "* - $v_ms");
            $client->Message(315, "* - $v_bw");
            $client->Message(315, "The magic in those items, when properly extracted can be woven into the power you seek.");
        }

        if($client->GetLevel() == 51)
        {
            quest::summonitem(132476);
            quest::summonitem(132479);

            my $v_focus = quest::varlink(132479);
            my $v_lab = quest::varlink(132476);

            my $v_bone = quest::varlink(132478);
            my $v_uil = quest::varlink(27210);
            my $v_pearl = quest::varlink(24995);
            my $v_bmar = quest::varlink(25805);
            my $v_ss = quest::varlink(65551);
            my $v_crack = quest::varlink(6515);
            #my $v_eye = quest::varlink(15771);

            my $v_wand = quest::varlink(132481);

            plugin::ClientSay("My research has led me to a simple way to produce the $v_focus, however, it does not have sufficient potency for ascension.");
            $client->Message(315, "I have read of an artifact that we can fashion that will charge it with energies from the past, absorbing the echoes left behind by those long dead.");
            $client->Message(315, "Use the $v_lab to construct the artifact.  For that you will need:");
            $client->Message(315, "* - $v_bone");
            $client->Message(315, "* - $v_uil");
            $client->Message(315, "* - $v_pearl");
            $client->Message(315, "* - $v_bmar");
            $client->Message(315, "* - $v_ss");
            $client->Message(315, "* - $v_crack");
            #$client->Message(315, "* - $v_eye");
            $client->Message(315, "Once you have fashioned the $v_wand you will be ready to charge the Focus.");
            $client->Message(315, "Activate the Focus and it will show you where to go.  Once you are there, use the wand.");
        }

        if($client->GetLevel() == 52)
        {
            plugin::ClientSay("My transcendence research has been very disappointing.  All of the ancient texts reveal that nobody has ascended past this point without great sacrifice.");
            $client->Message(315, "Some sacrificed life and limb, only living on in the nether, others sacrified their humanity and became horrific creatures.");
            $client->Message(315, "Much of the process is shrouded in mystery, but the only documented instance of one such individual still in existence is found in an ancient crypt.");
            $client->Message(315, "Seek out Harell Shin in Everfrost Peaks, but be careful $name, what you find out there may do us all more harm than good.");
        }

        if($client->GetLevel() == 53)
        {
            my $l_begin = quest::saylink("begin", 1, "I am ready to begin.");
            plugin::ClientSay("After our last incident I am hesitant to assist you with transcendence.");
            $client->Message(315, "There is, however, a method by which you could continue to ascend, but it requires that you make peace with some of the extra-planar beings you have offended.");
            $client->Message(315, "This is not a task to take lightly.  You would be marked as a pariah, accursed and outcast.");
            $client->Message(315, "You must return to the strength you were when you started this journey.");
            $client->Message(315, "Once you have earned your way back to the 50th tier, speak to me and your humility will be rewarded.");
            $client->Message(315, "* - $l_begin");
        }
    }

    if($text=~/begin/i)
    {
        if($client->GetLevel() == 53)
        {
            plugin::ClientSay("Very well $name, prepare yourself to receive the Mark of the Pariah.");
            $npc->SpellFinished(48, $client, 0, -1000);
            $client->Message(15, "The Mark of the Pariah is etched onto your aura.");
            my $curaa = $client->GetAAExp();
            $client->SetEXP(0, $curaa);
            $client->SetLevel(1);
            $client->BuffFadeAll();
            $client->UnmemSpellAll(1);

            my $pid = $client->GetPetID();
            my $pet = $entity_list->GetMobByID($pid);

            if($pet)
            {
                $pet->Kill();
            }

            $client->Message(315, "It is done.  You must complete the rest alone and despised.");
            $client->SetGlobal("54pariah", 1, 5, "F");
        }
    }
}

sub EVENT_ITEM
{
    if (plugin::check_handin(\%itemcount, 132477 => 1))
    {
        quest::summonitem(132477);
    }
    else
    {
        plugin::return_items(\%itemcount);
    }
}
