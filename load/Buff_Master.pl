## Buff Store/Unstore, will use spell 25895, Placeholder - Generic - DRU PC Spell to test for now once I get that done.
## $client->HasSpellScribed(id);
## quest::GetMana(id);
## $client->GetActSpellCost(spell_id, cost);
sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Greetings, $name.  I am the Buff Master.  A rather strange appelation, but it will work, I suppose.  Simply cast any beneficial spells on me, and I will note them for use with your Combinatorial Dweomer spell.");
	}
	if($text=~/reset/i) {
		quest::say("Resetting to just Strengthen in slot 1");
		quest::setglobal('BuffsCount',1,5,F);
		quest::setglobal('ComboBuff1',40,5,F);
	}
}

sub EVENT_CAST_ON {
	my $test = quest::IsBeneficialSpell($spell_id);
#	my $scribed = $client->HasSpellScribed($spell_id);  # Desired Functionality
my $scribed = 1; #temp for now to test;
## quest::say("spell $spell_id, Beneficial $test, Scribed $scribed");
	$first = "ComboBuff"; 		## Setting up strings for later usage.
	if ($test == 1  && $scribed == 1 && $spell_id != 25895) { ## Beneficial Buff 
		if (!defined $qglobals{BuffsCount}) { 			## No buffs set up.
			my $BuffsCount = 1;
			my $NextBuff = 1;
			quest::say("Great, we are going to store the spell number $spell_id at the slot $NextBuff.  This is your first buff!");
			quest::setglobal('BuffsCount',$BuffsCount,5,F);
			my $second = $NextBuff;
			my $string = $first . $second;
			quest::setglobal($string,$spell_id,5,F);
		}
		else {											## We already have buffs set up for this character.
			$BuffsCount = $qglobals{'BuffsCount'};
			$NextBuff = $BuffsCount+1;
			$FoundBuff = 0;
			$FoundBuffAt = 0;
			for ($x = 1; $x <= $BuffsCount; $x++) {		## Run through a list of buffs already stored to see if we already have this buff stored.
				my $second = $x;
				my $string = $first . $second;
				my $TestBuff = $qglobals{$string};
				if ($TestBuff == $spell_id ) {
					$FoundBuff = 1;
					$FoundBuffAt = $x;
					quest::say("We Found this buff already in slot $FoundBuffAt!");
				}
			}
			if ($FoundBuff == 0 ) {						## Simply add a new buff to the list.  We should also do a test here to see if they can cast it.
				quest::say("Great, we are going to store the spell number $spell_id at the slot $NextBuff");
				quest::setglobal('BuffsCount',$NextBuff,5,F);
				my $second = $NextBuff;
				my $string = $first . $second;
				quest::setglobal($string,$spell_id,5,F);
			}
			else {										## Remove a buff from the list, and bump everything down to close up the list.
				quest::say("We are going to remove the spell number $spell_id located in slot $FoundBuffAt.");
				my $second = $FoundBuffAt;
				my $string = $first . $second;
##				quest::say("Deleting spell $spell_id in $string");
				for ($y = $FoundBuffAt; $y <= $BuffsCount; $y++) {
					if ($y == $BuffsCount) {  			## Last Buff in the List
						my $second = $y;
						my $string = $first . $second;
						quest::say("End of string");
						quest::delglobal($string);
						quest::setglobal('BuffsCount',$BuffsCount-1,5,F);
					}
					else {								## Bring the next Spell down one level
						my $second = $y;
						my $stringOne = $first . $second;
						my $third = $y+1;
						my $stringTwo = $first . $third;
##						quest::say("Moving spell $qglobals{$stringTwo} in $stringTwoto slot $stringOne.");
						quest::setglobal($stringOne, $qglobals{$stringTwo},5,F);
					}
				}
			}
		}
	}
	elsif ($test != 1) {
		quest::say("That's not very nice, please don't cast nasty spells on me!");
	}
	elsif ($scribed != 1) {
		quest::say("I'll only accept spells that you cast yourself.");
	}
	elsif ($spell_id == 25895) {
		quest::say("We do not deal in recursion here.");
	}
	else {
		quest::say("That is not a valid buff, in fact, I'm not quite sure what you did but don't do it again.");
	}
}