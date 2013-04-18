sub EVENT_SPELL_EFFECT_CLIENT
{
    $caster = $entity_list->GetClientByID($caster_id);

    if($caster->GetLevel() == 52)
    {
        #Flat XP formula -- Fix their XP so they don't delevel
        #mod = 4;
        #float base = (check_levelm1)*(check_levelm1)*(check_levelm1);
        #mod *= 1000;
        #return(uint32(base * mod));

        my $expl = 52 * 52 * 52 * 4000;
        my $curxp = $caster->GetEXP();
        my $curaa = $caster->GetAAExp();

        if($curxp < $expl)
        {
            $caster->SetEXP($expl, $curaa);
        }

        $caster->SetLevel(53);
        $caster->Message(315, "Your mind is flooded with ancient knowlege.");
        $caster->Message(315, "The body you wear suddenly feels peculiar and foreign.");
    }
}
