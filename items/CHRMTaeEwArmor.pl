## One charm file for all four armor types, kept the whole list I mate at top commented out so I can steal later if needed.
## 11 possible points, but did it on a base 10 to make the transition less "jerky".  
## Makes the belt kind of a bonus if they wear it since it goes over the base stats for the charm.

sub EVENT_SCALE_CALC {
#	my $charm = $client->GetItemIDAt(0);
#	my $ear1 = $client->GetItemIDAt(1);
	my $head = $client->GetItemIDAt(2);
#	my $face = $client->GetItemIDAt(3);
#	my $ear2 = $client->GetItemIDAt(4);
#	my $neck = $client->GetItemIDAt(5);
#	my $shoulder = $client->GetItemIDAt(6);
	my $arms = $client->GetItemIDAt(7);
#	my $back = $client->GetItemIDAt(8);
	my $wrist1 = $client->GetItemIDAt(9);
	my $wrist2 = $client->GetItemIDAt(10);
#	my $range = $client->GetItemIDAt(11);
	my $hands = $client->GetItemIDAt(12);
#	my $primary = $client->GetItemIDAt(13);
#	my $secondary = $client->GetItemIDAt(14);
#	my $ring1 = $client->GetItemIDAt(15);
#	my $ring2 = $client->GetItemIDAt(16);
	my $chest = $client->GetItemIDAt(17);
	my $legs = $client->GetItemIDAt(18);
	my $feet = $client->GetItemIDAt(19);
	my $waist = $client->GetItemIDAt(20);

	my $scale = 0;
	
	if ( ($head == 27769) || ($head == 27776) || ($head == 27783) || ($head == 27790) ) {
		$scale++;
	}
	
	if ( ($arms == 27772) || ($arms == 27779) || ($arms == 27786) || ($arms == 27793) ) {
		$scale++;
	}
	
	if ( ($wrist1 == 27768) || ($wrist1 == 27775) || ($wrist1 == 27782) || ($wrist1 == 27789) ) {
		$scale++;
	}
	
	if ( ($wrist2 == 27768) || ($wrist2 == 27775) || ($wrist2 == 27782) || ($wrist2 == 27789) ) {
		$scale++;
	}
	
	if ( ($hands == 27766) || ($hands == 27773) || ($hands == 27780) || ($hands == 27787) ) {
		$scale++;
	}
	
	if ( ($chest == 27771) || ($chest == 27778) || ($chest == 27785) || ($chest == 27792) ) {
		$scale+=2;
	}
	
	if ( ($legs == 27770) || ($legs == 27777) || ($legs == 27784) || ($legs == 27791) ) {
		$scale+=2;
	}
	
	if ( ($feet == 27767) || ($feet == 27774) || ($feet == 27781) || ($feet == 27788) ) {
		$scale++;
	}
	
	if ( $waist == 27802 ) {
		$scale++;
	}
	
	$questitem->SetScale($scale/10); 
}