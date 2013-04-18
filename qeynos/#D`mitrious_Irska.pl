sub EVENT_SAY {
	if ($text=~/continue/i) {
		quest::say("Now that the scepter has been properly modified for the task, you must keep it safe for now. Your next task will be to seek out two more components, for the original components and the spells describing how they were forged are lost forever -- destroyed by Urwenae's second and final pupil who went mad while attempting to fulfill his duty. The Essence of Storms must be retrieved, and there is only one place within the whole of Norrath's prime or astral realms that it can be found -- the Plane of Sky. There is a being known as The Storm Mistress who dwells there. Seek her out and retrieve the Essence of Storms from her ethereal being. Do not worry yourself over what seems to be a gruesome murder and thieving, for she will coalesce again as all immortal, planar beings do in time. The second item that you must retrieve is the Cloudy Azure Sphere, which lies in the hands of [Priestess Auraia] in the depths of Kedge Keep.");
	}
	if ($text=~/Priestess Auraia/i) {
		quest::say("Auraia was once a priestess of the Prime Healer. Upon her travels throughout the world of Norrath, she stumbled blindly into the castle grounds of Mistmoore. Fortunately, it was during the daylight hours and she did not need to wander far before discovering the error of their ways. Quickly, she attempted to turn back, fearfully respecting the wish for privacy that is heavily guarded and ferociously enforced by the vampire lord's undead servants. As she made her way out of the castle grounds and returned to the boundaries of the Lesser Faydark forest, Auraia happened upon a recently discarded azure sphere. She had no idea what the sphere was intended for at first likely thinking it the lost toy of some Koada'Dal or gnomish child. However, she was intrigued by it and threw it in her pack for a later inquiry and inspection. Eventually, Auraia heard tales of the ancient underwater city known as Kedge Keep from her Koada'Dal hosts in Felwithe. The intrigue was too much for this young adventurer to bear and so she took the plunge, so to speak.  Her wanderlust seemed sated in this underwater jewel of years gone past, once home to the powerful Kedge race.  However, the sirens in the keep were the real lure, not any stories of adventure or history.  Through a dark spell, they turned her, and she has been living there as a mermaid ever since.  By whatever means necessary, return to me the Sphere and the Essence, $name, and you will be rewarded.");
	}
}
sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 9234 => 1, 9233 => 1)) { ## Scroll of the Tempest Eye && Scepter of Storms
		quest::say("The Scepter of Storms. . . but how could this be? You have spoken with Shayna, yes? I see that she has found one to retrieve the stolen tome. But what is even more intriguing is the acquisition of the scepter itself. I am impressed and these items represent your deeds better than any arrogant boasting that I hear day in and day out from the other youths of the order. Aaaah and yes, you have the scroll! Well then, we cannot let an opportunity like this slip through our fingers, now can we?'' The mage quickly eyes the scroll before closing his eyes and beginning an arcane chant. The scroll in his hand begins to smolder, although the page is not damaged. A glowing silver image of a swirling storm seems to reflect off the surface of the parchment. Then, the scepter begins to slightly chime and runes begin to magically imbed themselves into the scepter's base. The mage opens his eyes and extends the scepter to you, ''Now then, [shall we continue]");
		quest::summonitem(133495 ); ## Scepter of the Storms (Container)
		quest::faction(271,50); ## Residents of Jaggedpine
		quest::faction(159,50); ## Jaggedpine Treefolk
		quest::faction(265,50); ## Protectors of Pine
		quest::faction(135,50); ## Guards of Qeynos
		quest::exp(1000);
	} 
	elsif (plugin::check_handin(\%itemcount, 9235 => 1, 9236 => 1)) { ## Essence of the Storm && Cloudy Azure Sphere
		quest::emote("studies both items intently, muttering softly to himself at an inaudible tone. Eventually, the mage closes his eyes and begins to chant, the melodic weave of arcane words causing the essence to shimmer with the brilliance of an electrical storm. Slowly, he brings both hands together, sealing the ethereal essence within the magical sphere -- a union that forces a loud boom, the voice of thunder, to echo throughout the hall. D'mitrious opens his eyes and examines the completed orb and nods to himself, ''This should be sufficient. Take it and place it within the scepter. When the two enchanted items are united, the Orb of the Storm Caller will be forged.");
		quest::summonitem(133496); ## Disenchanted Orb of the Storm Caller
		quest::faction(271,50); ## Residents of Jaggedpine
		quest::faction(159,50); ## Jaggedpine Treefolk
		quest::faction(265,50); ## Protectors of Pine
		quest::faction(135,50); ## Guards of Qeynos
		quest::exp(1000);
	}
	else {
		plugin::return_items(\%itemcount);
	}
}
## Created/jayseesee for Orb of the Storm Caller quest.