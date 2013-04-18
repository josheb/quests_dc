sub EVENT_SIGNAL {
	$npc->AddToHateList($signal, 500);
}

sub EVENT_DEATH {
	if(!defined $qglobals{agentadd}) {
		$h = $npc->GetHeading();
		$DeltX = int(rand(15));
		$DeltY = int(rand(15));
		$DeltX = quest::ChooseRandom($DeltX,-$DeltX);
		$DeltY = quest::ChooseRandom($DeltY,-$DeltY);
		quest::spawn2(340034, 0, 0, -3477+$DeltX, 3143+$DeltY, 303, $h);
		quest::setglobal("agentadd",1,7,M1);
	}
}