sub EVENT_SPELL_EFFECT_CLIENT
{
   my $cl = $entity_list->GetClientByID($caster_id);
   if ($cl)
   {
        $cl->MovePC(998, 2, 50, 6, 127);
   }
}

