sub EVENT_SPELL_EFFECT_CLIENT
{
    $caster = $entity_list->GetClientByID($caster_id);

    if($caster->GetLevel() == 50)
    {
        #Flat XP formula -- Fix their XP so they don't delevel
        #mod = 4;
        #float base = (check_levelm1)*(check_levelm1)*(check_levelm1);
        #mod *= 1000;
        #return(uint32(base * mod));

        my $expl = 50 * 50 * 50 * 4000;
        my $curxp = $caster->GetEXP();
        my $curaa = $caster->GetAAExp();
        #$curaa += (23976503 * 2);
        #$caster->Message(315, "$curaa - ");

        if($curxp < $expl)
        {
            $caster->SetEXP($expl, $curaa);
        }

        $caster->SetLevel(51);
        $caster->AddAAPoints(2);
        $caster->Message(315, "Your mind is flooded with ancient knowlege.");
        $caster->Message(315, "The body you wear suddenly feels peculiar and foreign.");
        $caster->Message(15, "You have been granted 2 AA's for your level 51 journey.  Don't forget to turn on regular AA experience now!");
    }
}
