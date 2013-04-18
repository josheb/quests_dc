sub EVENT_SAY
{
    my $isa = $qglobals{"ADVKILL"};

    if($text=~/hail/i)
    {
        if($isa == 1)
        {
            my $l_pass = quest::saylink("passage", 1, "I seek passage");
            plugin::ClientSay("Welcome fellow adventurer.  Do you need transport to the Adventurer's Guild?");
            $client->Message(315, "* - $l_pass");
        }
        else
        {
            my $l_yes = quest::saylink("yes", 1, "Yes");
            plugin::ClientSay("Hello $name.  Have you come to seek entry to the Adventurer's Guild?");
            $client->Message(315, "* - $l_yes");
        }
    }

    if($text=~/passage/i)
    {
        if($isa == 1)
        {
            quest::movepc(998, 2, 50, 6);
        }
    }

    if($text=~/yes/i)
    {
        plugin::ClientSay("You must prove your worth by slaying a formidable opponent.");
        $client->Message(315, "The Adventurer's Guild cares little for racial or social disputes so some of these bounties may seem strange to you.");
        $client->Message(315, "Choose one, defeat them in battle and return to me.");
        $client->Message(315, "* - Nillipuss in Rivervale");
        $client->Message(315, "* - Dunedigger in North Ro");
        $client->Message(315, "* - Gnawfang in South Karana");
        $client->Message(315, "* - Misty Storyswapper in West Karana");
        $client->Message(315, "* - Tallus Holton in East Karana");
        $client->Message(315, "* - Peg Leg in Butcherblock Mountains");
        $client->Message(315, "* - Jailer Mkarrg in Warrens");
        $client->Message(315, "* - Ringo in Paludal Caverns");
    }
}
