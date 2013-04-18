## Buff Store/Unstore, will use spell 25895, Placeholder - Generic - DRU PC Spell to test for now once I get that done.
sub EVENT_CAST_ON {
	my $test = quest::IsBeneficialSpell($spellid);
	if ($test == 1 || $test eq 'true') { 				## Beneficial Buff (set testings for mana cost, class castable later)
		if (!defined $qglobals{BuffsCount}) { 			## No buffs set up.
			my $BuffsCount = 1;
			quest::say("Great, we are going to store the spell number $spellid at the slot $NextBuff.  This is your first buff!");
			quest::setglobal('BuffsCount',$BuffsCount,5,F);
			quest::setglobal('ComboBuff'$BuffsCount,$spellid,5,F);
		}
		else {											## We already have buffs set up for this character.
			my $BuffsCount = $qglobals{'BuffsCount'};
			my $NextBuff = $BuffsCount++;
			my $FoundBuff = 0;
			my $FoundBuffAt = 0;
			for ($x = 1; $x <= $BuffsCount, $x++) {		## Run through a list of buffs already stored to see if we already have this buff stored.
				my $TestBuff = $qglobals{'ComboBuff'$x};
				if ($TestBuff == $spellid ) {
					$FoundBuff = 1;
					$FoundBuffAt = $x;
				}
			}
			if ($FoundBuff == 0 ) {						## Simply add a new buff to the list.  We should also do a test here to see if they can cast it.
				quest::say("Great, we are going to store the spell number $spellid at the slot $NextBuff");
				quest::setglobal('BuffsCount',$NextBuff,5,F);
				quest::setglobal('ComboBuff'$NextBuff,$spellid,5,F);
			}
			else {										## Remove a buff from the list, and bump everything down to close up the list.
				quest::say("We are going to remove the spell number $spellid located in slot $FoundBuffAt.");
				quest::delglobal('ComboBuff'$FoundBuffAt);
				for ($y = $FoundBuffAt; $y <= $BuffsCount; $y++) {
					if ($y == $BuffsCount) {  			## Last Buff in the List
						quest::delglobal('ComboBuff'$y);
						quest::setglobal('BuffsCount',$BuffsCount-1,5,F);
					}
					else {								## Bring the next Spell down one level
						quest::setglobal('ComboBuff'$y, $qglobals{'ComboBuff'$y+1},5,F);
					}
				}
			}
		}
	}
	else { ## Non-Valid Buff
		quest::say("Not a valid buff.")
	}
}