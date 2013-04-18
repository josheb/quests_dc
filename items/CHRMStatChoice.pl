sub EVENT_SCALE_CALC {
	my $Cha = $client->GetMaxCHA();
	my $Str = $client->GetMaxSTR();
	my $Sta = $client->GetMaxSTA();
	my $Agi = $client->GetMaxAGI();
	my $Dex = $client->GetMaxDEX();
	my $Wis = $client->GetMaxWIS();
	my $Int = $client->GetMaxINT();
	my @Stats = ($Str, $Sta, $Agi, $Dex, $Wis, $Int, $Cha);
	my $Scale = 0;
  
##	foreach $test (@Stats) {
##		if (@Stats[$test] > $Scale) {
##			$Scale = $test;
##		}
##	}
	(sort {$b <=> $a} @Stats)[0];
	$Scale = @Stats[0];
	
	if($Scale > 300) {
		$Scale = 300;
	}	
	$Scale = $Scale/300;
	$questitem->SetScale($Scale);
}