## Random Loot through hash of hashes with turn in item as family, prices as role and rewards as the child to role.
## jayseesee@gmail.com for Sinclipse/Nerdgasm on Legends of Armada
## The lower the value of the item, the more "important" it will be, if that makes sense.  
## For example, in the 13073 item (bone chips): 
## 		If you roll a 1-10, it will get you the first item, even though it qualifies for the other 2 sets.
##		If you roll a 11-50, it will get you the second item, even though it qualifies for the highest set.
##		And if you get anything else, it will get you the last item.

sub EVENT_SPAWN {
$Total = 100; ## Sets up a total to iterate through later  Can bump this and change numbers later
%LootHash = (  ## This will be our hash of hashes
	'13073' => {  ## This is the turn in item, in this case, bone chips, what follows are rewards and their chances.
		'10' => '14102', ## 10% chance for this item
		'50' => '67281', ## 40% chance for this item
		'100'=> '85001'  ## 50% chance for this item
		},
	'10517' => {  ## Next reward item
		'5' => '14102',  ##  5% chance for this item
		'10' => '67281', ##  5% chance for this item
		'100'=> '85001'  ## 90% chance for this item
		}
);  ## You could also set the total to say 110, and then at 101-110, there'd be NO reward.  That would require a way to tell the player that they had horrible luck though.  I don't suggest it.

}


sub EVENT_ITEM {  ## You may want to add a detection that will see if more than one item was turned in, and if so, return items, else, run through our loops.  I'll leave that one up to you.
	$Value = 0;
	$Reward = 0;
	$FoundAt = 0;
	foreach $item (keys %LootHash) {  ## Iterate through all of the possible reward items
		if (plugin::check_handin(\%itemcount, $item =>1)) {  ## Our reward item was turned in
			$Value = int(rand($Total))+1;  ## Set a target
			foreach $price (keys %{$LootHash{$item}}) {  ## Iterate through the prices
				if ($price>= $Value) {  ## If the price is MORE than the value
					if ($FoundAt == 0) {  ## First detected item.
						$FoundAt = $price; ## Store the price it was found at, Hashes don't sort right
						$Reward = $LootHash{$item}{$price};  ## Set our reward to that
					}
					else { ## We've detected the potential for something else.
						if ($FoundAt < $price) { 
							$FoundAt = $price; ## Store that price and
							$Reward = $LootHash{$item}{$price};  ## Set our reward to the lower item
						}
					}

				}  ## Note, this is a bit counter-intuitive and clunky.  I couldn't think of a better way to really do this.  It will write over each time it finds a new item, which is fine, and the best way I could come up with it.
			}
		}
	}
	if ($Reward >= 0) {
		quest::summonitem($Reward);
	}
	else {
		plugin::return_items(\%itemcount);
	}
}