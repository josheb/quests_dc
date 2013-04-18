## Cycle Drops 

sub EVENT_SAY { #need correct text for all parts, pulled what I could
  if ($text=~/hail/i) {
    quest::say("I do not have time to talk to you, I am looking for a Disenchanted Piece of Yael.  Perhaps the Protector of the Ruins can assist you with this matter.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,  67041 => 1)) {
    quest::emote("turns to you and a voice echoes in your mind; 'I give you this in memory of my people, use it well. If you to wish craft something else return to me that which I have given.' ");
    quest::summonitem(67035);
  }
  elsif (plugin::check_handin(\%itemcount,  67035 => 1)) {
    quest::emote("turns to you and a voice echoes in your mind; 'Perhaps this will please you, if not, return to me that which I have given and we will craft you something else.'");
    quest::summonitem(67036);
  }
  elsif (plugin::check_handin(\%itemcount,  67036 => 1)) {
    quest::emote("turns to you and a voice echoes in your mind; 'Perhaps this will please you, if not, return to me that which I have given and we will craft you something else.'");
    quest::summonitem(67037);
  }
  elsif (plugin::check_handin(\%itemcount,  67037 => 1)) {
    quest::emote("turns to you and a voice echoes in your mind; 'Perhaps this will please you, if not, return to me that which I have given and we will craft you something else.'");
    quest::summonitem(67038);
  }
  elsif (plugin::check_handin(\%itemcount,  67038 => 1)) {
    quest::emote("turns to you and a voice echoes in your mind; 'Perhaps this will please you, if not, return to me that which I have given and we will craft you something else.'");
    quest::summonitem(67039);
  }
  elsif (plugin::check_handin(\%itemcount,  67039 => 1)) {
    quest::emote("turns to you and a voice echoes in your mind; 'Perhaps this will please you, if not, return to me that which I have given and we will craft you something else.'");
    quest::summonitem(67040);
  }
  elsif (plugin::check_handin(\%itemcount,  67040 => 1)) {
    quest::emote("turns to you and a voice echoes in your mind; 'Perhaps this will please you, if not, return to me that which I have given and we will craft you something else.'");
    quest::summonitem(67035);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}