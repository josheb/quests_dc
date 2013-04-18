#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
#Items Involved: Bardic letters: 18150-18167
#################

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
}
if($text=~/what mail/i){
quest::say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
}
if($text=~/i am interested/i){
quest::say("I have messages that need to go to Highpass, Kelethin, and Qeynos.  Will you [deliver] mail to [Kelethin], [Highpass], or [Qeynos] for me?");
}
if($text=~/deliver to kelethin/i){
quest::say("Take this pouch to Idia in Kelethin.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");
quest::summonitem("18167");
}
if($text=~/deliver to highpass/i){
quest::say("Take this pouch to Lislia Goldtune in Highpass.  You can find her at the entrance to HighKeep.  I am sure she will compensate you for your troubles."); 
quest::summonitem("18156");
}
if($text=~/deliver to qeynos/i){
quest::say("Take this pouch to Eve Marsinger in Qeynos.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");
quest::summonitem("18165");
}

}

sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18164 => 1) || plugin::check_handin(\%itemcount, 18166 => 1)) {
    quest::say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
    quest::givecash(0,0,quest::ChooseRandom(8,9,10,11,12),0);
    quest::exp(100);
    quest::faction(192,10); #league of antonican bards
    quest::faction(184,10); #knights of truth
    quest::faction(135,10); #guards of qeynos
    quest::faction(273,-30); #ring of scale
    quest::faction(207,-30); #mayong mistmoore
  }

else {
    quest::say("I have no need for that.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:freportn