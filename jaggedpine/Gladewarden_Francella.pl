#Nalina needs an item to turn in so we can make a more seamless task progression.
sub EVENT_SAY
{
    if($client->GetLevel() < 38)
    {
        $client->Message(315, "Greetings $name, isn't the view lovely?");
        return;
    }

    if($text=~/hail/i)
    {
        if(!$client->IsTaskCompleted(261) && !$client->IsTaskActive(261))
        {
            plugin::ClientSay("Hello $name.  Are you here to help?  We need someone to travel to Kerra Isle and find out why we're not getting any response from their diplomats.");
            plugin::ClientSay("We've discovered a spy in our midst.  Maybe you can gain her trust and learn more about these Nightkin.");
            $client->AssignTask(261, 0);
            return;
        }

        if($client->IsTaskActive(261))
        {
            if($client->IsTaskActivityActive(261, 5))
            {
                $client->UpdateTaskActivity(261, 5, 1);
                $client->AssignTask(262, 0);
                $client->Message(315, "Great work $name.  There have been some new developments since we last spoke.");
                return;
            }
            plugin::ClientSay("Head to Kerra $name, time is of the essence!");
            return;
        }

        #261 should be done - This shouldn't actually happen, but might as well leave a check
        if(!$client->IsTaskCompleted(262) && !$client->IsTaskActive(262))
        {
            plugin::ClientSay("We've discovered a spy in our midst.  Maybe you can gain her trust and learn more about these Nightkin.");
            $client->AssignTask(262, 0);
            return;
        }

        if($client->IsTaskActive(262))
        {
            plugin::ClientSay("Find Crysia, $name.  We need to learn more about this new threat.");
            return;
        }

        $client->Message(315, "Your help is appreciated $name, keep up the good work.");
    }
}

sub EVENT_ITEM
{
    #133480 - Sealed note from Crysia
    if(plugin::check_handin(\%itemcount, 133480 => 1))
    {
        $client->UpdateTaskActivity(262, 1, 1);
        plugin::ClientSay("What is this?");
        $client->AssignTask(263, 0);
        $client->Message(315, "We may have found the Nightkin lair.  You must go there and end this threat once and for all!");
    }
}
