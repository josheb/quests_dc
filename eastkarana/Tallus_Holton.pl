sub EVENT_KILLED_MERIT
{
    my $isa = $qglobals{"ADVKILL"};
    if(!$isa)
    {
        $client->SetGlobal("ADVKILL", 1, 5, "F");
        $client->Message(315, "You have completed the Adventurer's bounty.");
    }
}

