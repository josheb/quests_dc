sub EVENT_SPAWN {
	quest::settimer("Depop", 180);
}

sub EVENT_DEATH {
	quest::stoptimer("Depop");
}

sub EVENT_TIMER {
	quest::emote("wanders away in search for a greater challenge.");
	quest::stoptimer("Depop");
	quest::depop();
}

sub EVENT_COMBAT {
	if ($combat_state==1) {
		quest::stoptimer("Depop");
	}
	else {
		quest::settimer("Depop", 180);
	}
}