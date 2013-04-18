sub EVENT_ITEM_TICK
{
    my $lv = $client->GetLevel();
    my $en = $client->GetAggroCount();

    #Proc less out of combat
    if($en < 1)
    {
        my $doaggro = rand(100);
        if($doaggro < 60) { return; }
    }

    my @mobs = $entity_list->GetNPCList();

    my $cx = $client->GetX();
    my $cy = $client->GetY();
    my $cz = $client->GetZ();

    my $acount = 0;

#    $client->Message(315, "Finding distance...");
    foreach $m (@mobs)
    {
        #For now this just ignores all pets
        if(abs($m->GetX() - $cx) <= 100 && abs($m->GetY() - $cy) <= 100 && !$m->GetOwnerID())
        {
            $dst = $m->CalculateDistance($cx, $cy, $cz);
            if($dst <= 40)
            {
#                $client->Message(315, " - $dst");
                $m->AddToHateList($client, 1000);
                $acount++;
            }
        }
    }

    #$acount isn't perfectly accurate for this, but it's all we have
    if($acount > 0)
    {
        $client->Message(15, "Your $itemname emits a hateful shriek!");
    }
}
