sub EVENT_SPAWN {
	$npc->NPCSpecialAttacks(HABWSMCNDf, 0);
	$delta = quest::ChooseRandom(2,1,0,-1,-2);
	quest::setnexthpevent(85+$delta);
	$Healing = 0;
}

sub EVENT_TIMER {
	quest::signalwith(340028, 3);
	quest::stoptimer("Heal");
	$Healing = 0;
}

sub EVENT_CAST_ON {
	if ( ($spell_id == 20106) && ($Healing == 1) ) {
		quest::emote("staggers as her casting is interrupted.");
		quest::stoptimer("Heal");
		quest::signalwith(340028, 1);
		$Healing = 0
	}
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		quest::emote("concentrates her healing power on Nagafen, 'Hold on, my love!'");
		$Healing = 1;
		quest::settimer("Heal",10);
	}
	else {
		quest::emote("screams in unbridled rage and throws herself into the fight, spurred on by the unmoving form of Nagafen.");
		$npc->NPCSpecialAttacks(SMCNDf, 0);
		$Healing = 0;
		$npc->AddToHateList($signal, 500);
	}
}

sub EVENT_HP {
	if ($hpevent == 85+$delta) {
		$delta = quest::ChooseRandom(2,1,0,-1,-2);
		quest::setnexthpevent(80+$delta);
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
	}
	elsif ($hpevent == 80+$delta) {
		$delta = quest::ChooseRandom(2,1,0,-1,-2);
		quest::setnexthpevent(70+$delta);
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
	}
	elsif ($hpevent == 70+$delta) {
		$delta = quest::ChooseRandom(2,1,0,-1,-2);
		quest::setnexthpevent(60+$delta);
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
	}
	elsif ($hpevent == 60+$delta) {
		$delta = quest::ChooseRandom(2,1,0,-1,-2);
		quest::setnexthpevent(55+$delta);
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
	}
	elsif ($hpevent == 55+$delta) {
		$delta = quest::ChooseRandom(2,1,0,-1,-2);
		quest::setnexthpevent(40+$delta);
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
	}
	elsif ($hpevent == 40+$delta) {
		$delta = quest::ChooseRandom(2,1,0,-1,-2);
		quest::setnexthpevent(25+$delta);
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
	}
	elsif ($hpevent == 25+$delta) {
		$delta = quest::ChooseRandom(2,1,0,-1,-2);
		quest::setnexthpevent(20+$delta);
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
	}
	elsif ($hpevent == 20+$delta) {
		quest::setnexthpevent(10);
		SpawnAdd();
		SpawnAdd();
		SpawnAdd();
	}
	else {
		$npc->NPCSpecialAttacks(HABWSMCNDf,0);
		quest::emote("is mortally stricken, letting out a piteous snarl and falls over, unconscious.");
		quest::signalwith(340030,4);
		$npc->WipeHateList();
		$npc->SetAppearance(3);
	}
}

sub SpawnAdd {
	$ToSpawn = quest::ChooseRandom(340032,340033);
	$h = $npc->GetHeading();
	$DeltX = int(rand(15));
	$DeltY = int(rand(15));
	$DeltX = quest::ChooseRandom($DeltX,-$DeltX);
	$DeltY = quest::ChooseRandom($DeltY,-$DeltY);
	quest::spawn2($ToSpawn, 0, 0, -3477+$DeltX, 3143+$DeltY, 303, $h);
	quest::signalwith($ToSpawn,$targetid);
}