sub EVENT_SAY
{
    if($text=~/hail/i)
    {
        my $l_air = quest::saylink("air", 1, "air");
        plugin::ClientSay("Do you seek transport to the plane of $l_air?");
    }

    if($text=~/air/i)
    {
        plugin::ClientSay("I can open a portal for you with the appropriate components.");
        $client->Message(315, "Bring me two griffon feathers and we can begin.");
    }
}

sub EVENT_ITEM
{
  if(plugin::check_handin(\%itemcount, 16538 => 2))
  {
    plugin::ClientSay("May the currents bring you good fortune.");
    #quest::summonitem(10092);
    #$client->CastSpell(666,$userid);
    quest::zone(airplane);
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

