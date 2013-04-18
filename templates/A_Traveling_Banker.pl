sub EVENT_SPAWN
{
    quest::say("Greetings fellow travelers.  I will be available to assist you with your banking needs for the next 5 minutes.");
    quest::settimer("BANKWARN", 270);
    quest::settimer("BANKDIE", 300);
}

sub EVENT_TIMER
{
    if($timer eq "BANKWARN")
    {
        quest::say("I will be departing soon, please finish all transactions.");
    }

    if($timer eq "BANKDIE")
    {
        quest::stopalltimers();
        quest::say("It has been a pleasure doing business, goodbye!");
        $npc->Depop();
    }
}
