sub EVENT_SPAWN {
   my $ran = int(rand(750));
   quest::settimer(1,$ran);
} 

sub EVENT_TIMER {
  my $random = int(rand(2));
  if($random == 0) {
    quest::say("Nillipuss is my name. Stealing jumjum is my game. Think you can catch me? Let's see if you can! I'll always run faster than you ever ran.");
  }
  else {
    quest::say("Look what I've found! What a great find! It used to be yours, but now it is mine!");
  }
}

sub EVENT_KILLED_MERIT
{
    my $isa = $qglobals{"ADVKILL"};
    if(!$isa)
    {
        $client->SetGlobal("ADVKILL", 1, 5, "F");
        $client->Message(315, "You have completed the Adventurer's bounty.");
    }
}
