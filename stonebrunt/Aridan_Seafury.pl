sub EVENT_SAY
{
    if($text=~/hail/i)
    {
        my $l_gun = quest::saylink("gunthak", 1, "Gunthak");
        plugin::ClientSay("Hello there $name!  You seeking passage to $l_gun?");
    }

    if($text=~/gunthak/i)
    {
        my $i_col = quest::varlink(10727);
        my $i_fcs = quest::varlink(6324);
        my $i_blw = quest::varlink(5402);

        plugin::ClientSay("I don't let just anyone aboard my ship.  You prove yourself a capable mate first and I'll see you to your destination.");
        $client->Message(315, "Bring me a suitable trophy to show your worth.  Any one will do.");
        $client->Message(315, "* - $i_col");
        $client->Message(315, "* - $i_fcs");
        $client->Message(315, "* - $i_blw");
    }
}

sub EVENT_ITEM
{
    if(plugin::check_handin(\%itemcount, 10727 => 1))
    {
        quest::say("Good on you $name, you're welcome aboard my ship anytime!");
        $client->SetZoneFlag(224);
        $client->SetZoneFlag(225);
        $client->SetZoneFlag(226);
        $client->SetZoneFlag(227);
        $client->SetZoneFlag(228);
    }
    elsif(plugin::check_handin(\%itemcount, 6324 => 1))
    {
        quest::say("Good on you $name, you're welcome aboard my ship anytime!");
        $client->SetZoneFlag(224);
        $client->SetZoneFlag(225);
        $client->SetZoneFlag(226);
        $client->SetZoneFlag(227);
        $client->SetZoneFlag(228);
    }
    elsif(plugin::check_handin(\%itemcount, 5402 => 1))
    {
        quest::say("Good on you $name, you're welcome aboard my ship anytime!");
        $client->SetZoneFlag(224);
        $client->SetZoneFlag(225);
        $client->SetZoneFlag(226);
        $client->SetZoneFlag(227);
        $client->SetZoneFlag(228);
    }
    else
    {
        quest::say("I do not need this.");
        plugin::return_items(\%itemcount);
    }
}
