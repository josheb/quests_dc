sub EVENT_SAY
{
    if($text=~/hail/i)
    {
        my $l_hate = quest::saylink("hate", 1, "hate");
        plugin::ClientSay("Hello $name. What brings you to this dark place?  Are you seeking passage to $l_hate?");
    }

    if($text=~/hate/i)
    {
        plugin::ClientSay("Very well.  I can transport you there, but the materials I need are rare and my research isn't free.");
        $client->Message(315, "I would send you after the components but I doubt you would know how to properly gather them.  No, I must do the gathering myself.");
        $client->Message(315, "Give me two diamonds and I will perform the planar transport ritual.");
    }
}

sub EVENT_ITEM
{
  if(plugin::check_handin(\%itemcount, 10037 => 2))
  {
    plugin::ClientSay("Thank you $name, now hold still while I begin the ritual.");
    #quest::summonitem(10092);
    #$client->CastSpell(666,$userid);
    #quest::zone(hateplane);
    quest::movegrp(76, -354, -369, 4);
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

