
sub EVENT_EXIT {
	quest::movepc(366, $x, $y, $z);
	$client->Message(315, "You have stepped out of the testing area, you will be returned!");		
}

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	quest::set_proximity($x - 70, $x + 70, $y - 70, $y + 70);
}