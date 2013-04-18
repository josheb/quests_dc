sub EVENT_SPAWN
{
	quest::settimer("try_sit", 1);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(3);
                quest::stoptimer("try_sit");
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("try_sit");
}

sub EVENT_SAY
{
	if($text=~/deity/i && $status>2)
	{
		quest::say("CHANGING YOUR DEITY! YOU WILL BE KICKED TO CHARSELECT!");
		quest::changedeity(211);
	}
}