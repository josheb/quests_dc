## Copied #Stiggles_Cogswin.pl, this is second phase of the fight that was not live.

my $x;
my $y;
my $z;
my $h;

sub EVENT_SPAWN {
     quest::setnexthpevent(10);
}

sub EVENT_HP {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
    if($hpevent == 10) {
    	for ($spawn = 1; $spawn<9; $spawn++) {
    		quest::spawn2(123163,0,0,$x,$y,$z,$h); ## pops 9 of the "junk" spiders
    	}
  	quest::spawn2(123164,0,0,$x,$y,$z,$h);  ## pops the one that drops the page
    } 
 }