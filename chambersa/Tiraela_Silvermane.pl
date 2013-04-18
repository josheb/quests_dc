sub EVENT_SAY
{
    if($text=~/hail/i)
    {
        if($client->GetLevel() == 52)
        {
            my $i_mf = quest::varlink(133440);
            my $i_no = quest::varlink(133441);
            my $i_sl = quest::varlink(133442);
            my $i_as = quest::varlink(133443);

            plugin::ClientSay("You've done it now $name.  He's almost into our plane and this is our last chance to stop him.");
            $client->Message(315, "Your thirst for power has made you foolish, but we can still fix this.");
            $client->Message(315, "Until he is fully manifested he can only use a limited set of spells and summon thralls from his nether prison.");
            $client->Message(315, "His minions carry remnants of their former lives that I can use to fashion items to free the souls he's summoned to complete the ritual.");
            $client->Message(315, "Bring me a $i_mf, a $i_no, a $i_sl, and $i_as and I will craft you a wand to free those he has bound to his service.");
            $client->Message(315, "Once they are all freed you may be able to defeat him.");
        }
        else
        {
            my $l_tele = quest::saylink("home", 1, "Take me home");
            plugin::ClientSay("You did it!  You defeated him and you've ascended in the process, but at what cost?");
            $client->Message(315, "* - $l_tele");
        }
    }

    if($text=~/home/i)
    {
        if($client->GetLevel() > 52)
        {
            quest::zone('ecommons');
        }
    }
}

sub EVENT_ITEM
{
    if(plugin::check_handin(\%itemcount, 133440 => 1, 133441 => 1, 133442 => 1, 133443=> 1))
    {
        plugin::ClientSay("Excellent work, use this to free one of his slaves!");
        quest::summonitem(133434);
    }
    else
    {
        plugin::return_items(\%itemcount);
    }
}
