sub EVENT_SPELL_EFFECT_CLIENT
{
    my $pid = $client->GetPetID();
    my $pet = $entity_list->GetMobByID($pid);

    if($pet)
    {
        $client->Message(315, "You leech the essence of your pet.");
        $pet->Kill();
    }
}

sub EVENT_SPELL_EFFECT_BUFF_TIC_CLIENT
{
    my $pid = $client->GetPetID();
    my $pet = $entity_list->GetMobByID($pid);

    if($pet)
    {
        $client->Message(315, "You leech the essence of your pet.");
        $pet->Kill();
    }
}
