sub EVENT_SPAWN {
	quest::say("Quickly, speak with me, I will aid you, you haven't much time!");
	quest::settimer("depop", 30);
}

sub EVENT_TIMER {
	quest::say("I must leave, they'll notice my intereference!");
	quest::stoptimer("depop");
	quest::depop();
}

sub EVENT_SAY {
	quest::say("Let me lend you a bit of aid!  Good luck!");
	quest::stoptimer("depop");
	quest::selfcast(135);
	quest::depop();
}