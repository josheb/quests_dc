sub EVENT_SPAWN
{
    if($npc->GetCleanName() eq "DYNBOSS")
    {
        $npc->TempName(plugin::GetRandomName(3, 8));

        my $lv = plugin::GetScore($npc);
        my $lt = plugin::GetLootTable($lv);

        if($lv)
        {
            $npc->AddLootTable($lt);
        }

        #TODO - Buff HP and damage, maybe check race, class, etc.
    }
}

sub EVENT_SAY
{
#    $client->Message(315, "Test");
#    my $kc = $npc->GetSpawnKillCount();
#    $client->Message(315, "-- $kc");
}
