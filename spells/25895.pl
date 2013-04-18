sub EVENT_SPELL_EFFECT_CLIENT {
	my $ClientID = $entity_list->GetClientByID($caster_id);
	if ($ClientID) {
		$Target = $ClientID->GetTarget();
		if (!defined $qglobals{BuffsCount}) {
			$ClientID->Message(15, "You have not set up any buffs so far.  Please see the Buff Master in Forgotten Halls to get your buffs set up.");
		}
		else {
			$BuffsCount = $qglobals{'BuffsCount'};
			for ($x = 1; $x <= $BuffsCount; $x++) {	
				my $first = "ComboBuff"; 
				my $second = $x;
				my $string = $first . $second;
				$Buff = $qglobals{$string};
				if ($x == 1) {
					@spells = $Buff;
					$manaCost = quest::GetMana($Buff);
					$manaCost = $client->GetActSpellCost($Buff,$manaCost);
					$ManaTotal = $manaCost;
				}
				else {
					push (@spells, $Buff);
					$manaCost = quest::GetMana($Buff);
					$manaCost = $client->GetActSpellCost($Buff,$manaCost);
					$ManaTotal = $ManaTotal + $manaCost;
				}
			}
			$ManaTotal = int($ManaTotal*1.5);
			if ($ManaTotal > $client->GetMana()) {
				$client->Message(15, "You do not have the mana to cast this spell.  Either regain some, or think of removing a few buffs with the Buff Master.  Total cost is $ManaTotal.");
			}
			else {
				$client->SetMana($client->GetMana()-$ManaTotal);
				foreach $spell (@spells) {
					$client->SpellFinished($spell,$Target,0,-1000);
				}
				$client->Message(15, "Total Cost, $ManaTotal");
			}
		}
	}
}

sub EVENT_SPELL_EFFECT_NPC {
	$client->Message(15, "We are sorry, you can not use this spell on an NPC");
}