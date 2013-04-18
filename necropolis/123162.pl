sub EVENT_SPAWN {
	quest::set_proximity($x-35,$x+35,$y-35,$y+35);
	$time=7;
	$started=0;
}
sub EVENT_PROXIMITY_SAY {
	if ($text=~/Remember, Garzicor/i && $started == 0) {
		quest::settimer(1,90);
		$started=1;
	}
}

sub EVENT_TIMER {
	$newtimer = 1+$timer;
	if ($timer == 1) {
		quest::emote("Help");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 2) {
		quest::emote("Veeshan waits");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 3) {
		quest::emote("Must have revenge");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 4) {
		quest::emote("Kromzek Must die");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 5) {
		quest::emote("Must spill blood");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 6) {
		quest::emote("Vengeance!");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 7) {
		quest::emote("Home!");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 8) {
		quest::emote("Vengeance!");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 9) {
		quest::emote("Home!");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 10) {
		quest::emote("I am one but two");
		quest::settimer($newtimer, $time);
	}
	elsif ($timer == 11) {
		quest::emote("I am sorry");
		quest::creategroundobject(1888, $x+3, $y+3, $z, $h);
		quest::creategroundobject(1889, $x-3, $y-3, $z, $h);
		$started = 0;
	}
	else {
		quest::say("No Timer Found!");
	}
	quest::stoptimer($timer);
}