sub EVENT_SPAWN
{
    quest::say("Greetings fellow travelers.  My wares will be available for purchase for the next 5 minutes.");
    quest::settimer("MERCHWARN", 270);
    quest::settimer("MERCHDIE", 300);
}

sub EVENT_TIMER
{
    if($timer eq "MERCHWARN")
    {
        quest::say("I will be departing soon, please finish all transactions.");
    }

    if($timer eq "MERCHDIE")
    {
        quest::stopalltimers();
        quest::say("It has been a pleasure doing business, goodbye!");
        $npc->Depop();
    }
}
