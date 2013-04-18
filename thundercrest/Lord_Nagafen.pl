sub EVENT_SPAWN {
	$delta = quest::ChooseRandom(2,1,0,-1,-2);
	quest::setnexthpevent(85+$delta);
}

sub EVENT_SIGNAL {
	if ($signal == 3) {
		quest::emote("roars in delight, completely healed by Vox's lifegiving magic.");
		$delta = quest::ChooseRandom(2,1,0,-1,-2);
		quest::setnexthpevent(85+$delta);
		$npc->NPCSpecialAttacks(SMCNDf,0);
		$npc->SetHP($npc->GetMaxHP());
	}
	if ($signal == 1) {
		quest::emote("screams in rage and is vulnerable once more.");
		$npc->NPCSpecialAttacks(SMCNDf,0);
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
		SendCH();
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
		SendCH();
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
		SendCH();
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
		SendCH();
		SpawnAdd();
	}
	else {
		$npc->NPCSpecialAttacks(HABWSMCNDf,0);
		quest::emote("is mortally stricken, letting out a piteous snarl and falls over, unconscious.");
		quest::signalwith(340029,$targetid);
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


sub SendCH {
	quest::emote("roars and concentrates on defense, waiting for his mate to heal him.");
	$npc->NPCSpecialAttacks(ABWSMCNDf,0);
	quest::signalwith(340029,1);
}