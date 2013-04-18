sub EVENT_SAY {
	my $SLevel = quest::getlevel(0);
	my $GLevel = quest::getlevel(1);
	my $passlevel = ($SLevel, $GLevel)[$SLevel < $GLevel];
	plugin::ChanceSpawn(110116,$passlevel);
}