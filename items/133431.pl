sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $en = $client->GetAggroCount();
    my $hpp = $client->GetHP() / $client->GetMaxHP();

    if($en < 1) { return; }
	if($hpp > 0.75) { return; }

    my @spells75 = (43, 6132, 461, 308, 7583, 4392, 3922, 6239, 6235);
	my @spells50 = (2326, 6133, 2175, 471, 1599, 7584, 8019, 3883, 6247, 6773, 6238);
	my @spells25 = (6134, 9782, 1444, 471, 1599, 7585, 8019, 3884, 6247, 5043, 6775, 5039);

	if($lv > 45)
	{
		push(@spells50, 9764);
		push(@spells25, 9765);
		push(@spells25, 3289);
		push(@spells25, 5033);
	}

	if($lv > 50)
	{
		push(@spells50, 1653);
		push(@spells50, 9785);
		push(@spells25, 733);
		push(@spells25, 1657);
		push(@spells25, 9785);
		push(@spells25, 6241);
	}

	my $sp = 0;

	if($hpp <= 0.75) { $sp = quest::ChooseRandom(@spells75); }
	if($hpp <= 0.5)  { $sp = quest::ChooseRandom(@spells50); }
	if($hpp <= 0.25) { $sp = quest::chooseRandom(@spells25); }

    $client->Message(15, "The $itemname is surrounded in a fierce red aura.");
    #$client->CastSpell($sp, $client->GetID(), 10, 0, 0);
    $client->SpellFinished($sp, $client, 0, -1000);
}
