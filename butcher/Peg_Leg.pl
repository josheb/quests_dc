# This is to spawn a lesser spirit upon the Peg Leg's death for Shaman epic 1.0

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(68251,0,0,$x,$y,$z,$h);
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

#Submitted by: Jim Mills
