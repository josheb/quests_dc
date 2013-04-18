sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Nice to meet you. $name. If you are a fellow bard. I must inform you that you will make no profit around here. Not with Guard McCluskey around."); }
}
#END of FILE Zone:qey2hh1  ID:3574 -- Misty_Storyswapper 

sub EVENT_KILLED_MERIT
{
    my $isa = $qglobals{"ADVKILL"};
    if(!$isa)
    {
        $client->SetGlobal("ADVKILL", 1, 5, "F");
        $client->Message(315, "You have completed the Adventurer's bounty.");
    }
}
