sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say("Hello $name. Antonius Bayle and the council have ordered a full investigation of these folks that call themselves the Bloodsabers. I hear his plan is to eventually round up every member of this strange disease worshipping cult and bring them in to answer for their terrible crimes against our city and people. [Vegalys] Keldrane is heading up the investigation.  Unless you are here for [research]?");
	}
	if ($text=~/research/i) {
		quest::say("We are currently in the process of conducting research into viable ways to bring an end to this terrible plague. This suffering has gone on long enough. Being a researcher doesn't take strength or brute force, though those qualities do sometimes help. Being a researcher takes intelligence first and foremost. No offense, but not everyone has that quality. This will be no easy task. Are you still [interested] in helping us with our research?");
	}
	if ($text=~/interested/i) {
		quest::say("Still interested? Very well then $name, you look rather intelligent. As a show of your commitment to this task, please turn in your [Interrogator's Badge]");
	}
	if ($text=~/problem/i) {
		quest::say("Unfortunately, those vile followers of the Plague Bringer are still attempting to foul up our plans. Several our [test animals] have been stolen from us by a gnome, a member of the Dark Reflection. These animals are very important to our research, as the briefing describes.");
	}
	if ($text=~/test animals/i) {
		quest::say("These animals were enchanted with a sort of anti-disease aura. It sounds crazy but we thought that perhaps we could use a sort of 'anti-epidemic' to spread a cure to this disease. However, this aura is as of yet imperfect and also quite [volatile]. We had hoped to use rats to spread the cure, much in the same way they often spread disease. ");
	}
	if ($text=~/volatile/i) {
		quest::say("Yes, the enchantment we placed on the rodents does not last long at all. It disperses its curing magic almost instantly. We fashioned several containers at great expense and they have the ability to preserve an enchantment for long periods of time. After enchanting a rat we [place them in the container] until we are ready to conduct our tests. ");
	}
	if ($text=~/place them in the container/i) {
		quest::say("Oh, I assure you it is completely humane and the rats do seem to enjoy prolonged exposure to the enchantment while in the container. In fact, it is all we can do to get them out of the containers once we put them in! In any case, those containers are dreadfully expensive to make and those rats. . . Well, we have begun to become sort of attached to them. Please find this [gnome].");
	}
	if ($text=~/gnome/i) {
		quest::say("Her name is Oobnopterbevny Biddilets. She was last seen high tailing it across the Plains of Karana. She infiltrated our temple and stole the containers that had our beloved rodents, which were already enchanted and prepared for our next round of tests. I shudder to think of what this monster may be doing to those poor animals. Anyway, retrieve them at any cost. You will need them for the [tests] you will be conducting. ");
	}
	if ($text=~/tests/i) {
		quest::say("The briefing explains how the test is to be conducted but first you need to find the test animals. Get the rodents first from that gnome. Then give me your Researcher's Briefing and we will start the test. Release all three rodents as directed then give me the three Empty Enchanted Jars. If you were able to cure all of the diseased rodents by properly using our enchanted rodents, we will consider this test a success and you shall be rewarded with the Researchers Badge.");
	}
}
sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 2397 => 1) { ## Interrogator's Badge
		quest::say("It seems Vegalys trusts you, so I guess I can trust you as well. Take this briefing. It explains the current state of our research and it explains the test you will be conducting. If you can conduct the test successfully, the Temple of Life shall be in your debt and we shall use the findings to continue our work. However, we have a [problem] we need assistance with first.");
		quest::summonitem(2397); ## Interrogator's Badge
		quest::summonitem(18295); ## Research Briefing
	} 
	else {
		plugin::return_items(\%itemcount);
	}
}
## Created/jayseesee for Researcher's Badge Quest Lines