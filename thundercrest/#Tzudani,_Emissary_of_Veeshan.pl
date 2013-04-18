sub EVENT_SPAWN {
	$Complete = 0;
	$Chest = 340031;
}

sub EVENT_SAY {
	my $stop = quest::saylink("stop", 1, "stop");
	my $home = quest::saylink("home", 1, "home");
	if( ($text =~ /Hail/i) && ($Complete == 0)) {
		quest::say("Thank the Allmother, $name, that you are here!  Eager for a taste of power and without regard for the consequences, Lord Nagafen and Lady Vox have broken from their prisons and have met up here.  We believe they are intending to break the First Draconic Law, with two opposing colored dragons mating, they could create another prismatic dragon!  Kerafyrm was bad enough, what could these do!  You must [$stop] them!");
	}
	if( ($text =~ /stop/i) && ($Complete == 0)) {
		quest::say("Take this, it has the ability to circumvent Vox's healing power.  She will be utterly devoted to Lord Nagafen, and he will keep her from harm, concentrate on him first!");
		quest::say("Good Luck, $name, you may end up needing it.");
		quest::summonitem(37955,50);
	}
	if($text =~ /Hail/i && $Complete == 1) {
		quest::say("Very good, $name, you've helped put the beasts away!");
		quest::say("I may return you to your soul's [$home] if you'd wish.");
		quest::depop(340028);
		quest::depop(340029);
	}
	if ($text =~ /return/i && $Complete == 1) {
		quest::say("Fare well!");
		quest::selfcast(36);
	}
}


sub EVENT_SIGNAL {
	quest::shout("Oh my! You did it!  This is truely amazing.  We will now banish the unconscious dragons back to their respective lairs.  Hopefully the warding will hold this time.  Come back to me, and we'll see about getting you rewarded.");
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	$h = $npc->GetHeading();
	quest::spawn2($Chest,0,0,$x,$y-20,$z,$h);
	$Complete = 1;
	my @clientlist = $entity_list->GetClientList();
	foreach $ent (@clientlist) {
		if ($ent) {
			$targid = $ent->GetID();
			$targid = $entity_list->GetClientByID($targid);
			$charid = $targid->CharacterID();
			quest::targlobal("DragonEvent",1,H12,"ANY", $charid,"ANY");
		}
	}			
}