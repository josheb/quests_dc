sub EVENT_SAY
{
    if($text=~/hail/i)
    {
        my $l_who = quest::saylink("who", 1, "Who are you?");
        my $l_sanc = quest::saylink("sanctum", 1, "I wish to go to the Frozen Sanctum.");

        plugin::ClientSay("Hello $name.  It's nice to see someone among the living for a change.");
        $client->Message(315, "I hope the guardians didn't give you much trouble.  They're attracted to the power of this place.");
        $client->Message(315, "* - $l_who");
        $client->Message(315, "* - $l_sanc");
    }

    if($text=~/who/i)
    {
        plugin::ClientSay("I am Harell Shin, Wizard of the highest order!");
        $client->Message(315, "Back home in Akanon I was renowned for my abilities.");
        $client->Message(315, "Over time my control over magic grew stronger and stronger but my body grew weak.  Once the elders realized what I had become I was exiled.");
        $client->Message(315, "I have no evil desire to rule or conquer, so I settled here where I could read and study in peace.  There is a rift nearby to an ancient sanctum full of darkness, but also knowledge.");
        $client->Message(315, "Sometimes I visit for new books, but it isn't an especially friendly place for the living.");
    }

    if($text=~/sanctum/i)
    {
        plugin::ClientSay("Very well, I hope you return with your mortal coil!");
        quest::zone("mird");
    }
}
