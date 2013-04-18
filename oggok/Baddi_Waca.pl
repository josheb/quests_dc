sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say('Hello. I am the guild master.');
 }
}

#No note turnin script - hijacked from the halas one.
sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 36001 => 1))
    {
        quest::say("You a zerker?  Good.  Take dis an stain it with the blood of our enemies.");
        quest::summonitem(36009); # Furless Bearskin Tunic
        quest::exp(300);        # Give exp for turning in quest
    }
    else {
        plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
        plugin::return_items(\%itemcount);
    }
}
